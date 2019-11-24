#include "Cache.h"
#include "math.h"

/* Constants */
const unsigned block_size = 64; // Size of a cache line (in Bytes)
const unsigned cache_size = 2048; // Size of a cache (in KB)
const unsigned assoc = 16;
// Also use to hash the PC value


Cache *initCache()
{
    Cache *cache = (Cache *)malloc(sizeof(Cache));

    cache->blk_mask = block_size - 1;

    unsigned num_blocks = cache_size * 1024 / block_size;
    cache->num_blocks = num_blocks;
    //printf("Num of blocks: %u\n", cache->num_blocks);


    // Initialize all cache blocks
    cache->blocks = (Cache_Block *)malloc(num_blocks * sizeof(Cache_Block));
    
    int i;
    for (i = 0; i < num_blocks; i++)
    {
        cache->blocks[i].tag = UINTMAX_MAX; 
        cache->blocks[i].valid = false;
        cache->blocks[i].dirty = false;
        cache->blocks[i].when_touched = 0;
        cache->blocks[i].frequency = 0;
	cache->blocks[i].outc = false;
	cache->blocks[i].Sig_M = 0;
    }


    // Initialize Set-way variables
    unsigned num_sets = cache_size * 1024 / (block_size * assoc);
    cache->num_sets = num_sets;
    cache->num_ways = assoc;
    //printf("Num of sets: %u\n", cache->num_sets);

    unsigned set_shift = log2(block_size);
    cache->set_shift = set_shift;
    //printf("Set shift: %u\n", cache->set_shift);

    unsigned set_mask = num_sets - 1;
    cache->set_mask = set_mask;
    //printf("Set mask: %u\n", cache->set_mask);

    unsigned tag_shift = set_shift + log2(num_sets);
    cache->tag_shift = tag_shift;
   //printf("Tag shift: %u\n", cache->tag_shift);


    // Initialize Sets
    cache->sets = (Set *)malloc(num_sets * sizeof(Set));
    for (i = 0; i < num_sets; i++)
    {
        cache->sets[i].ways = (Cache_Block **)malloc(assoc * sizeof(Cache_Block *));
    }

    // Combine sets and blocks
    for (i = 0; i < num_blocks; i++)
    {
        Cache_Block *blk = &(cache->blocks[i]);
        
        uint32_t set = i / assoc;
        uint32_t way = i % assoc;

        blk->set = set;
        blk->way = way;

        cache->sets[set].ways[way] = blk;
    }
    
    // Initialize the Counters
    cache->numCounters = pow(2,assoc);
    cache->countMask = cache->numCounters - 1;
    cache->SHCT = (Sat_Counter *)malloc(cache->numCounters * sizeof(Sat_Counter));
    for (i = 0; i < cache->numCounters; i++)
    {
       	cache->SHCT[i].counter = 0;
    }
    //printf("Num of Counters: %u\n", numCounters);

    return cache;
}

bool accessBlock(Cache *cache, Request *req, uint64_t access_time)
{
    bool hit = false;

    uint64_t blk_aligned_addr = blkAlign(req->load_or_store_addr, cache->blk_mask);
//    printf("blk_addr: %d\n", blk_aligned_addr);

    uint64_t Signature = req->PC & ~cache->countMask >> assoc;
   //printf("Signature: %ld\n", Signature);

    Cache_Block *blk = findBlock(cache, blk_aligned_addr);
   
    if (blk != NULL) 
    {
        hit = true;

        // Update access time	
        blk->when_touched = access_time;
        // Increment frequency counter
        ++blk->frequency;

	++cache->SHCT[Signature].counter; 	
	blk->outc = true;

        if (req->req_type == STORE)
        {
            blk->dirty = true;
        }
    }

    return hit;
}

bool insertBlock(Cache *cache, Request *req, uint64_t access_time, uint64_t *wb_addr)
{
    // Step one, find a victim block
    uint64_t blk_aligned_addr = blkAlign(req->load_or_store_addr, cache->blk_mask);
    uint64_t Signature = req->PC & ~cache->countMask >> assoc;

    Cache_Block *victim = NULL;
    bool wb_required = cache_policy(cache, blk_aligned_addr, &victim, wb_addr);
    assert(victim != NULL);

    // Step two, insert the new block
    uint64_t tag = req->load_or_store_addr >> cache->tag_shift;
    victim->tag = tag;
    victim->valid = true;

    victim->when_touched = access_time;
    victim->frequency = cache->SHCT[Signature].counter;

    victim->PC = req->PC;
    victim->core_id = req->core_id;

    victim->Sig_M = Signature;
    victim->outc = false;

    if (req->req_type == STORE)
    {
        victim->dirty = true;
    }

    return wb_required;
    //printf("Inserted: %"PRIu64"\n", req->load_or_store_addr);
}

// Helper Functions
inline uint64_t blkAlign(uint64_t addr, uint64_t mask)
{
    return addr & ~mask;
}

Cache_Block *findBlock(Cache *cache, uint64_t addr)
{
   //printf("findBlock()\n");
   //printf("Addr: %"PRIu64"\n", addr);

    // Extract tag
    uint64_t tag = addr >> cache->tag_shift;
   //printf("Tag: %"PRIu64"\n", tag);

    // Extract set index
    uint64_t set_idx = (addr >> cache->set_shift) & cache->set_mask;
   //printf("Set: %"PRIu64"\n", set_idx);

    Cache_Block **ways = cache->sets[set_idx].ways;
    int i;
    for (i = 0; i < cache->num_ways; i++)
    {
        if (tag == ways[i]->tag && ways[i]->valid == true)
        {
            return ways[i];
        }
    }

    return NULL;
}

bool cache_policy(Cache *cache, uint64_t addr, Cache_Block **victim_blk, uint64_t *wb_addr)
{
    uint64_t set_idx = (addr >> cache->set_shift) & cache->set_mask;
   //printf("cache_policy()\n");
   //printf("Set: %"PRIu64"\n", set_idx);
    Cache_Block **ways = cache->sets[set_idx].ways;

    // Step one, try to find an invalid block.
    int i;
    for (i = 0; i < cache->num_ways; i++)
    {
        if (ways[i]->valid == false)
        {
            *victim_blk = ways[i];
            return false; // No need to write-back
        }
    }

    // Step two, if there is no invalid block. Locate the LRU/LFU block
    Cache_Block *victim = ways[0];
    for (i = 1; i < cache->num_ways; i++)
    {
	#ifdef LRU
        if (ways[i]->when_touched < victim->when_touched)
        {
            victim = ways[i];
        }
	#endif
	#ifdef LFU
        if (ways[i]->frequency < victim->frequency)
        {
            victim = ways[i];
        }
	#endif
    }
    
   //printf("PC of victim: %ld\n", victim->PC);
    if(victim->outc == 0){	// Decrease Counter
    	if(cache->SHCT[victim->Sig_M].counter > 0){
		--cache->SHCT[victim->Sig_M].counter;
	}
    }

    // Step three, need to write-back the victim block
    *wb_addr = (victim->tag << cache->tag_shift) | (victim->set << cache->set_shift);
    uint64_t ori_addr = (victim->tag << cache->tag_shift) | (victim->set << cache->set_shift);
   //printf("Evicted: %"PRIu64"\n", ori_addr);
    fflush(stdout); 

    // Step three, invalidate victim
    victim->tag = UINTMAX_MAX;
    victim->valid = false;
    victim->dirty = false;
    victim->frequency = 0;
    victim->when_touched = 0;

    *victim_blk = victim;

    return true; // Need to write-back
}

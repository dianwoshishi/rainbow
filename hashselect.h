#include "md5.h"
#include "sm3.h"


// #define _SM3 1

typedef void HASHptr(uint8_t* dst, const uint8_t* src, uint64_t slen);


#ifdef _SM3
#define DIGEST_LENGTH SM3_DIGEST_LENGTH
static HASHptr *my_hash = &SM3; 
#elif _MD5
#define DIGEST_LENGTH MD5_DIGEST_LENGTH
static HASHptr *my_hash = &MD5; 
#else//默认md5
#define DIGEST_LENGTH MD5_DIGEST_LENGTH
static HASHptr *my_hash = &MD5; 
#endif
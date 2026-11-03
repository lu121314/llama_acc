/* Aligned accesses to ARM Device mappings. Ordinary memcpy is not an MMIO API. */
#include <stddef.h>
#include <stdint.h>
#include <string.h>

static void io_barrier(void) {
#if defined(__aarch64__)
    __asm__ volatile("dsb sy" ::: "memory");
#else
    __sync_synchronize();
#endif
}

int llama_write_words(void *mapping, const void *source, size_t bytes) {
    if (((uintptr_t)mapping & 3u) || (bytes & 3u)) return -1;
    volatile uint32_t *target = (volatile uint32_t *)mapping;
    const unsigned char *input = (const unsigned char *)source;
    io_barrier();
    for (size_t i = 0; i < bytes / 4; ++i) {
        uint32_t word;
        memcpy(&word, input + 4 * i, sizeof(word));
        target[i] = word;
    }
    io_barrier();
    return 0;
}

int llama_read_words(void *target, const void *mapping, size_t bytes) {
    if (((uintptr_t)mapping & 3u) || (bytes & 3u)) return -1;
    const volatile uint32_t *source = (const volatile uint32_t *)mapping;
    unsigned char *output = (unsigned char *)target;
    io_barrier();
    for (size_t i = 0; i < bytes / 4; ++i) {
        uint32_t word = source[i];
        memcpy(output + 4 * i, &word, sizeof(word));
    }
    io_barrier();
    return 0;
}

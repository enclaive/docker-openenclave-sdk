// Copyright (c) Open Enclave SDK contributors.
// Licensed under the MIT License.

#include <openenclave/host.h>
#include <stdio.h>

#include "helloworld_u.h"


oe_enclave_t* enclave = NULL;


void host_helloworld()
{
    fprintf(stdout, "Enclave called into host to print: Hello World!\n");
}

int create_enclave()
{
    char enclave_path[] = "../enclave/helloworldenc.signed";
    uint32_t flags = OE_ENCLAVE_FLAG_DEBUG;

    // Create the enclave
    oe_result_t result = oe_create_helloworld_enclave((char*) &enclave_path, OE_ENCLAVE_TYPE_AUTO, flags, NULL, 0, &enclave);
    if (result != OE_OK)
    {
        fprintf(
            stderr,
            "oe_create_helloworld_enclave(): result=%u (%s)\n",
            result,
            oe_result_str(result));
        return 1;
    }
    fprintf(stdout, "Enclave created\n");

    return 0;
}

int call_enclave()
{
    // Call into the enclave
    oe_result_t result = enclave_helloworld(enclave);

    if (result != OE_OK)
    {
        fprintf(
            stderr,
            "calling into enclave_helloworld failed: result=%u (%s)\n",
            result,
            oe_result_str(result));
        return 1;
    }

    return 0;
}

int terminate_enclave()
{
    // Clean up the enclave if we created one
    if (enclave)
        oe_terminate_enclave(enclave);
        fprintf(stdout, "Enclave terminated\n");

    return 0;
}

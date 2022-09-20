#include <stdio.h>

#define bus char
unsigned char vcd[255] = {0}; // Any characters behind the pointer
unsigned char vtd[255] = {0}; // Matched tk
unsigned char vsd[255] = {0}; // Matched generics
const char ttk[9] = " (){}+-="; // Tokens that can be placed next to values
const char *tk[3] = {"print","if","goto"};
const char p[255] = "print this and this";

void ps(unsigned char* f, unsigned char value) { // Push back
    f[f[254]] = value;
    f[254]++;
}

unsigned bus length(str)
	const char *str;
{
	const char *s;
	for (s = str; *s; ++s);
	return(s - str);
}

void ch() {
    if (vcd[254] > 0) {
        for (unsigned bus c = 0; c < vcd[254]; c++) ps(vsd, vcd[c]);
        ps(vsd, '\n');
        ps(vtd, 0);
        for (int t = 0; t < 255; t++) vcd[t] = 0;
    }
}

void is_numeric(str)
    const char *str;
{

}

int main()
{
    unsigned bus c = 0;
    unsigned char r = 254;
    do {
        for (unsigned char t = 0; t < 8; t++) { // Single character instant terminating tokens
            if (ttk[t] == p[c]) {
                ch();
                r = t + 2;
            }
            t = 8;
        }
        ps(vcd, p[c]); // Add latest char to the hopper
        for (unsigned char t = 0; t < 3; t++) { // If matches longer command
            unsigned char match = 1;
            for (int n = 0; n < length(tk[t]); n++) {
                if (vcd[n] != tk[t][n]) {
                    match = 0;
                }
            }
            if (match == 1) {
                r = 10 + t;
                t = 3;
            }
        }
        if (r < 254) { // If matched
            ps(vtd, r);
            for (int t = 0; t < 255; t++) vcd[t] = 0;
            r = 254;
        }
        c++;
    } while (c < 255 && p[c] > 0);

    ch();

    // Inspect results
    for (unsigned char c = 0; c < vsd[254]; c++) printf("%c", vsd[c]);
    for (unsigned char c = 0; c < vtd[254]; c++) printf("%i, ", (int)vtd[c]);
    printf("\n");

    return 0;
}
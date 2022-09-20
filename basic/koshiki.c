#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define ENTRYLEN 64

typedef struct {
  int *array;
  size_t used;
  size_t size;
} Array;

void arrayInit(Array *a, size_t initialSize) {
  a->array = malloc(initialSize * sizeof(int));
  a->used = 0;
  a->size = initialSize;
}

void arrayInsert(Array *a, int element) {
  if (a->used == a->size) {
    a->size *= 2;
    a->array = realloc(a->array, a->size * sizeof(int));
  }
  a->array[a->used++] = element;
}

void arrayFree(Array *a) {
  free(a->array);
  a->array = NULL;
  a->used = a->size = 0;
}

int main()
{
    Array data;
    arrayInit(&data, 1);

    Array commands;
    arrayInit(&commands, 1);

    Array bounds;
    arrayInit(&bounds, 1);

    char words[ENTRYLEN];
    int i = 0;
    int j = 0;

    printf("#include <stdio.h>\n\nint main() {\n");

    while(scanf("%64s", words) >= 0) {

        // Main commands
        j = commands.used;
        if (strcmp(words, "nook") == 0)             arrayInsert(&commands, 1);
        else if (strcmp(words, "cranny") == 0)      arrayInsert(&commands, 2);
        else if (strcmp(words, "skip") == 0)        arrayInsert(&commands, 3);
        else if (strcmp(words, "skipback") == 0)    arrayInsert(&commands, 4);
        else if (strcmp(words, "spot") == 0)        arrayInsert(&commands, 5);
        else if (strcmp(words, "print") == 0)       arrayInsert(&commands, 6);
        else if (strcmp(words, "input") == 0)       arrayInsert(&commands, 7);

        // Symbols
        else if (strcmp(words, ";") == 0)   arrayInsert(&commands, 8);
        else if (strcmp(words, "+") == 0)   arrayInsert(&commands, 9);
        else if (strcmp(words, "-") == 0)   arrayInsert(&commands, 10);
        else if (strcmp(words, "=") == 0)   arrayInsert(&commands, 11);
        else if (strcmp(words, "(") == 0)   arrayInsert(&commands, 12);
        else if (strcmp(words, ")") == 0)   arrayInsert(&commands, 13);
        else if (strcmp(words, "\"") == 0)  arrayInsert(&commands, 14);

        else if (j == commands.used) {

            // Copy over
            do {
                arrayInsert(&data, words[i]);
                i++;
            } while(words[i] != 0);

            arrayInsert(&data, 0);
            arrayInsert(&commands, 0);

            // Clear array
            do {
                words[i] = 0;
                i--;
            } while(i != 0);
        }
    }

    j = 0;
    do {
        switch (commands.array[i]) {
            
            // print
            case 6: {
                printf("\tprintf(");
                do {
                    j++;
                } while (commands.array[j] != 8);
                printf(")\n");
                i = j;
                break;
            }
        }
        i++;
        j++;
    } while(i < commands.used);

    arrayFree(&data);
    arrayFree(&commands);

    return 0;
}
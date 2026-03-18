#include <iostream>
#include <utility>
#include <vector>

#include "bubblesort.hpp"

#ifdef DEBUG_BUBBLE
static void printVector(const std::vector<int>& arr) {
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
}
#endif

void bubbleSort(std::vector<int>& arr) {
    int n = static_cast<int>(arr.size());
    for (int i = 0; i < n - 1; ++i) {
        for (int j = 0; j < n - i - 1; ++j) {
            if (arr[j] > arr[j + 1]) {
                std::swap(arr[j], arr[j + 1]);
#ifdef DEBUG_BUBBLE
                printVector(arr);
#endif
            }
        }
    }
}

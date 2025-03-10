#include <algorithm>
#include <fstream>
#include <iostream>
#include <map>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

#include <KAN.cpp>
#include <defines.h>

// hls-fpga-machine-learning insert bram

#define CHECKPOINT 100000000000000

namespace nnet
{
    bool trace_enabled = true;
    std::map<std::string, void *> *trace_outputs = NULL;
    size_t trace_type_size = sizeof(double);
} // namespace nnet

int main(int argc, char **argv)
{
    // hls-fpga-machine-learning insert namespace

    // load input data from text file
    std::ifstream fin("tb_data/tb_input_features.dat");
    // load predictions from text file
    std::ifstream flbl("tb_data/tb_labels.dat");

#ifdef RTL_SIM
    std::string RESULTS_LOG = "tb_data/rtl_cosim_results.log";
#else
    std::string RESULTS_LOG = "tb_data/csim_results.log";
#endif
    std::ofstream fout(RESULTS_LOG);

    std::string iline;
    std::string lline;
    int e = 0;

    int correct = 0, total = 0;

    if (fin.is_open() && flbl.is_open())
    {
        while (std::getline(fin, iline) && std::getline(flbl, lline))
        {
            if (e % CHECKPOINT == 0)
                std::cout << "Processing input " << e << std::endl;
            char *cstr = const_cast<char *>(iline.c_str());
            char *current;

            // std::vector<input_t> in;
            input_t in[N_INPUT];
            current = strtok(cstr, " ");
            for (int i = 0; i < N_INPUT; i++)
            {
                in[i] = atof(current);
                current = strtok(NULL, " ");
            }

            cstr = const_cast<char *>(lline.c_str());

            result_t lbl[N_OUTPUT];
            current = strtok(cstr, " ");
            for (int i = 0; i < N_OUTPUT; i++)
            {
                lbl[i] = atof(current);
                current = strtok(NULL, " ");
            }

            // hls-fpga-machine-learning insert data
            result_t pr[N_OUTPUT];
            KAN(in, pr);

            int pr_max = -1, pr_max_val = -1e9;
            for (int i = 0; i < N_OUTPUT; i++)
            {
                if (pr[i] > pr_max_val)
                    pr_max = i;
            }
            if (lbl[pr_max] == 1)
                correct++;
            total++;

            if (e % CHECKPOINT == 0)
            {
                std::cout << "Input" << std::endl;
                // hls-fpga-machine-learning insert predictions
                for (int i = 0; i < N_INPUT; i++)
                {
                    std::cout << in[i] << ", ";
                }
                std::cout << std::endl;
                std::cout << "Predictions" << std::endl;
                // hls-fpga-machine-learning insert predictions
                for (int i = 0; i < N_OUTPUT; i++)
                {
                    std::cout << pr[i] << ", ";
                }
                std::cout << std::endl;
                std::cout << "Labels" << std::endl;
                for (int i = 0; i < N_OUTPUT; i++)
                {
                    std::cout << lbl[i] << ", ";
                }
            }
            e++;

            // hls-fpga-machine-learning insert tb-output
        }
        std::cout << "Correct: " << correct << " out of total " << total << std::endl;
        fin.close();
        flbl.close();
    }
    else
    {
        std::cout << "INFO: Unable to open input/predictions file, using default input." << std::endl;

        // hls-fpga-machine-learning insert zero

        // hls-fpga-machine-learning insert top-level-function

        // hls-fpga-machine-learning insert output

        // hls-fpga-machine-learning insert tb-output
    }

    fout.close();
    std::cout << "INFO: Saved inference results to file: " << RESULTS_LOG << std::endl;

    return 0;
}
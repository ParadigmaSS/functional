#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <time.h>

using namespace std;

int main() {

  string image_name;
  cin >> image_name;
  ifstream in_image(image_name.c_str());
  if(in_image.is_open()) { 
  // Read the reader of the file.
    string magic_number;
    getline(in_image, magic_number);
    cout << magic_number << endl;

    string comment;
    getline(in_image, comment);
    cout << comment << endl;

    int width;
    in_image >> width;
    cout << width  << endl;

    int height;
    in_image >> height;
    cout << height << endl;

    int max;
    in_image >> max;
    cout << max<< endl;

    unsigned long long int image_lenght = (width * height *3);
    cout << image_lenght << endl;

    
    int pix[image_lenght];

    for(int i=0; i < image_lenght; i++) {
      in_image >> pix[i];
    }
    // Variables to guard the begining and ending time.
    double start;
    double end;
    start = clock();
    for(int i=0; i < image_lenght; i++) {
      pix[i] = 255 - pix[i];
    }
    end = clock();

    double total_time;
    total_time = (double) (end-start)/CLOCKS_PER_SEC;

    cout << "Tempo gasto na aplicação do filtro: " << total_time << endl;

    // Generate new image.
    ofstream out_image("out.ppm");
    out_image << magic_number << endl;
    out_image << comment << endl;
    out_image << width << endl;
    out_image << height << endl;
    out_image << max << endl;

    for(int i=0; i < image_lenght; i++) {
      out_image << pix[i] << endl;
    }
  } else {
    cout << "Erro na leitura da imagem." << endl;
  }
  in_image.close();
  return 0;
}

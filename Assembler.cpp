#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <cstdlib>
#include <fstream>
#include <string.h>

using namespace std;

int main () {
		ifstream assFile;
		ofstream binFile;
		stringstream assSplitter; 
		assFile.open ("text.mem");
		binFile.open("CompiledBinary.txt"); 
		string assRawCmd, assCmd;

		while ( getline (assFile,assRawCmd) ){

			assCmd = assRawCmd.substr(0,assRawCmd.find('#'));

			if(!assRawCmd.compare("") || !assCmd.compare(""))
				continue; 
			else assCmd = assCmd + " ";

			string oper, inOne, inTwo;
			string opCode, binInOne, binInTwo; 
			assSplitter << assCmd; 
			assSplitter >> oper;
			assSplitter >> inOne; 
			assSplitter >> inTwo; 

			if(!oper.compare("addl")){

				if(!inOne.compare("$r0")){
					binInOne = "00";
				}else if(!inOne.compare("$r1")){
					binInOne = "01";
				}
				else if(!inOne.compare("$r2")){
					binInOne = "10";
				}
				else if(!inOne.compare("$r3")){
					binInOne ="11";
				}

				int param = atoi(inTwo.c_str());
				int countCmds = param / 4;
				int extra = param % 4;

				for(int i = 0; i < countCmds; i++)
					cout << "Yo" << endl;

			}else if(!oper.compare("sup")){

				cout << "Hello " << endl;

			}else{

				if(!oper.compare("mv")){
					opCode = "0000";
				}else if(!oper.compare("add")){
a				} else if(!oper.compare("and")){
					opCode = "0010";
				} else if(!oper.compare("not")){
					opCode = "0011";
				}else if(!oper.compare("nor")){
					opCode = "0100"; 
				}else if(!oper.compare("slt")){
					opCode = "0101";
				}else if(!oper.compare("sll")){
					opCode = "0110";
				}else if(!oper.compare("srl")){
					opCode = "0111"; 
				}else if(!oper.compare("j")){
					opCode = "1000";
				}else if(!oper.compare("jal")){
					opCode = "1001";
				}else if(!oper.compare("lw")){
					opCode = "1010";
				}else if(!oper.compare("sw")){
					opCode = "1011"; 
				}else if(!oper.compare("beq")){
					opCode = "1100";
				}else if(!oper.compare("bne")){
					opCode = "1101"; 
				}else if(!oper.compare("addi")){
					opCode = "1110"; 
				}else if(!oper.compare("li")){
					opCode = "1111";
				}

				if(!inOne.compare("$r0")){
					binInOne = "00";
				}else if(!inOne.compare("$r1")){
					binInOne = "01";
				}
				else if(!inOne.compare("$r2")){
					binInOne = "10";
				}
				else if(!inOne.compare("$r3")){
					binInOne ="11";
				}

				if(!inTwo.compare("$r0")){
					binInTwo = "00";
				}else if(!inTwo.compare("$r1")){
					binInTwo = "01";
				}
				else if(!inTwo.compare("$r2")){
					binInTwo = "10";
				}
				else if(!inTwo.compare("$r3")){
					binInTwo ="11";
				}
				else{
					binInTwo = inTwo;
				}

				binFile << opCode << binInOne << binInTwo << "\n";
			}
		}
	assFile.close();
	binFile.close();
	return 0;
}

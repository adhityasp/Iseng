#include<stdio.h>
#include<vector>
#include<time.h>
#include<stdlib.h>

#define rowMaze 3
#define colMaze 3
struct point{
	int rowPoint;
	int colPoint;
};

struct wayPoint{
	int from,to;
};

char maze[rowMaze*2+1][colMaze*2+1];
std::vector<int> walk;//point yg dijalanin
std::vector<int> frontier;//sebelah walk
std::vector<wayPoint> way;//jalan

int getRandomResult(int min, int max){
	return rand()%max + min;
}

bool isNeighbour(point *from, point *to){
	if(from->rowPoint +1 == to->rowPoint && from->colPoint == to->colPoint){return true;}//cek kanan
	if(from->rowPoint -1 == to->rowPoint && from->colPoint == to->colPoint){return true;}//cek kiri
	if(from->rowPoint == to->rowPoint && from->colPoint + 1 == to->colPoint){return true;}//cek bawah
	if(from->rowPoint == to->rowPoint && from->colPoint - 1 == to->colPoint){return true;}//cek atas
	return false;
}

point *convertNomorToPoint(int nomor){
	point *p = new point();
	p->colPoint = nomor / rowMaze;
	p->rowPoint = nomor % rowMaze;
	return p;
}

point *convertNomorToMapPoint(int nomor){
	point *p = new point();
	p->colPoint = nomor / rowMaze * 2 + 1;
	p->rowPoint = nomor % rowMaze * 2 + 1;
	return p;
}

int convertPointToNomor(int x, int y){
	return y * rowMaze + x;
}

bool isFrontier(int num){
	for(int i = 0 ;i < frontier.size(); i++){
		if(num == frontier.at(i))return true;
	}
	return false;
}

bool isWalk(int num){
	for(int i = 0 ;i < walk.size(); i++){
		if(num == walk.at(i))return true;
	}
	return false;
}

void addFrontier(int x, int y){
	if(!isFrontier(convertPointToNomor(x - 1,y)) && !isWalk(convertPointToNomor(x - 1,y)) && x - 1 >= 0){// cek kiri
		frontier.push_back(convertPointToNomor(x-1,y));
	}
	if(!isFrontier(convertPointToNomor(x + 1,y)) && !isWalk(convertPointToNomor(x + 1,y)) && x + 1 < rowMaze){// cek kanan
		frontier.push_back(convertPointToNomor(x+1,y));
	}
	if(!isFrontier(convertPointToNomor(x,y - 1)) && !isWalk(convertPointToNomor(x,y - 1)) && y - 1 >= 0){// cek bawah
		frontier.push_back(convertPointToNomor(x,y-1));
	}
	if(!isFrontier(convertPointToNomor(x,y + 1)) && !isWalk(convertPointToNomor(x,y + 1)) && y + 1 < colMaze){// cek atas
		frontier.push_back(convertPointToNomor(x,y+1));
	}

}

int main(){
	// isi semua maze jadi wall
	for(int i = 0; i < colMaze * 2 + 1; i++){
		for(int j = 0; j < rowMaze * 2 + 1; j++){
			maze[j][i] = '#';
		}
	}

	//push initial point
	walk.push_back(0);
	frontier.push_back(1);
	frontier.push_back(rowMaze);

	//cek setiap point dengan frontiernya
	while(!frontier.empty()){
		//random frontier yg mau dijadiin walk terus dimasukin ke walk
		srand(time(NULL));
		int randomResult = rand()%frontier.size(); // random frontier yg mau dipake
		int newWalk = frontier.at(randomResult);//dapet walk baru
		frontier.erase(frontier.begin()+randomResult);//apus frontier yg uda diinjek

		walk.push_back(newWalk); // masukin walk ke vector
		
		//bkin way
		wayPoint newWay;
		point *to = convertNomorToPoint(newWalk);
		point *from;

		for(int i = 0; i < walk.size()-1; i++){
			from = convertNomorToPoint(walk.at(i));
			//cek sebelahan, klo sebelahan baru di masukin ke way
			if(isNeighbour(from,to)){
				newWay.from = walk.at(i);
				newWay.to = newWalk;
				way.push_back(newWay);
				break;
			}
		}
		//addfrontier
		addFrontier(to->rowPoint,to->colPoint);
	}

	////print map
		for(int i = 0 ; i < walk.size(); i++){
			maze[convertNomorToMapPoint(walk.at(i))->rowPoint][convertNomorToMapPoint(walk.at(i))->colPoint] = ' ';
		}

		for(int i = 0 ; i < way.size(); i++){
			maze[(convertNomorToMapPoint(way.at(i).from)->rowPoint + convertNomorToMapPoint(way.at(i).to)->rowPoint) / 2]
			[(convertNomorToMapPoint(way.at(i).from)->colPoint + convertNomorToMapPoint(way.at(i).to)->colPoint) / 2] = ' ';
		}

		for(int i = 0; i < colMaze * 2 + 1; i++){
			for(int j = 0; j < rowMaze * 2 + 1; j++){
				printf("%c",maze[j][i]);
			}
			printf("\n");
		}	
	getchar();
	return 0;
}
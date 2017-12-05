#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<vector>

const int width=10;
const int height=10;
char maze[width][height];



struct Point{
	int x;
	int y;
};

struct way{
	int from,to;
};


std::vector<int> frontier;
std::vector<int> walk;
std::vector<way> jalan;


Point *ceknomortoxyasli(int nomor){
	Point *p = (Point *) malloc(sizeof(Point));
	p->x = nomor%width;
	p->y = nomor/width;
	//printf("pp %d %d\n",p->x,p->y);
	return p;
}

Point* ceknomortoxymap(int nomor){
	Point *p = (Point *) malloc(sizeof(Point));
	p->x  = nomor%width * 2 + 1;
	p->y = nomor/width * 2 + 1;
	return p;
}

int cekxytonomor(int x,int y){
	return y * width + x;
}

bool cekSebelahan(Point *from, Point *to){
	
	//printf("from %d %d\n to %d %d\n",from->x,from->y,to->x,to->y);
	if(from->x + 1 == to->x && from->y == to->y){
		//cek kanan
		return true;
	}
	if(from->x - 1 == to->x && from->y == to->y){
		//cek kiri
		return true;
	}
	if(from->x == to->x && from->y + 1 == to->y){
		//cek bawah
		return true;
	}
	if(from->x == to->x && from->y - 1 == to->y){
		//cek atas
		return true;
	}
	return false;
}

bool isWalk( int nomor ){
	for( int i = 0 ; i < walk.size() ; i++ ){
		if(nomor==walk.at(i))return true;
	}
	return false;
}

bool adagakdifrontier(int nomor){
	for(int i=0;i<frontier.size();i++){
		if(nomor == frontier.at(i))return true;
	}
	return false;
}

void addFrontier(int x, int y){
	if( x+1 < width && !isWalk( cekxytonomor( x + 1, y ) ) && !adagakdifrontier(cekxytonomor(x + 1, y)) ){
		frontier.push_back(cekxytonomor(x+1, y));
	}
	if( x-1 >= 0 && !isWalk( cekxytonomor( x - 1, y ) ) && !adagakdifrontier(cekxytonomor(x - 1, y)) ){
		frontier.push_back(cekxytonomor(x-1, y));
	}
	if(y+1 < height && !isWalk( cekxytonomor( x, y + 1 ) ) && !adagakdifrontier(cekxytonomor(x, y + 1))){
		frontier.push_back(cekxytonomor(x, y+1));
	}
	if(y-1 >= 0 && !isWalk( cekxytonomor( x , y - 1) ) && !adagakdifrontier(cekxytonomor(x , y - 1))){
		frontier.push_back(cekxytonomor(x, y-1));
	}
}
int main(){
	//isi semua maze jadi wall
	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++)
		maze[j][i] = '*';
	}

	
	walk.push_back(0);
	frontier.push_back(1);
	frontier.push_back(width);
	while(!frontier.empty()){
		int x = width;
		int y = height;

		srand(time(NULL));
		int hasilrandom = rand()%frontier.size();
		int pointbaru = frontier.at(hasilrandom);
		frontier.erase(frontier.begin()+hasilrandom);

		walk.push_back(pointbaru);
		//bkin way
		way jalanbaru;
		Point *to = ceknomortoxyasli(pointbaru);
		

		Point *from;
		for(int i = 0;i < walk.size()-1; i++){
			from = ceknomortoxyasli(walk.at(i));
			if(cekSebelahan(from,to)){//cek sebelahan
				jalanbaru.from = walk.at(i);
				jalanbaru.to = pointbaru;
				jalan.push_back(jalanbaru);
				break;
			}
		}
		
		//add new frontier
		addFrontier(to->x,to->y);
		
	}

	char map[width*2+1][height*2+1];

	for(int i = 0; i < height * 2 + 1; i++){
		for(int j = 0; j < width * 2 + 1; j++){
			map[j][i] = '*';
		}
	}

	for(int i=0;i<walk.size();i++){
		map[ceknomortoxymap(walk.at(i))->x][ceknomortoxymap(walk.at(i))->y]= ' ';
	}

	for(int i=0;i<jalan.size();i++){
		map[ (ceknomortoxymap(jalan.at(i).from)->x + ceknomortoxymap(jalan.at(i).to)->x) /2 ]
		[ (ceknomortoxymap(jalan.at(i).from)->y + ceknomortoxymap(jalan.at(i).to)->y) /2 ] = ' ';
	}
	
	for(int i=0;i<height*2+1;i++){
		for(int j=0;j<width*2+1;j++){
			printf("%c",map[j][i]);
		}
		printf("\n");
	}

	getchar();
	return 0;
}
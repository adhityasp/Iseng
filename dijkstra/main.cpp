#include<stdio.h>
#include<vector>
#include<time.h>
#include<stdlib.h>

using namespace std;

struct coord{
	int x,y;
};
struct Tile{
	int x,y;
	char character;
	int cost;
	bool visited;
	bool opened;
	Tile *parent;
	Tile *kiri,*kanan,*atas,*bawah;
};

int main(){
	Tile myTile[100][100];

	for(int i=0;i<30;i++){
		for(int j=0;j<90;j++){
			myTile[i][j].x = j;
			myTile[i][j].y = i;
			myTile[i][j].character =' ';
			myTile[i][j].cost = 999;
			myTile[i][j].visited = false;
			myTile[i][j].opened = false;
			myTile[i][j].parent = NULL;
			if(j>0)
				myTile[i][j].kiri = &myTile[i][j-1];
			else
				myTile[i][j].kiri = NULL;
			if(j<78)
				myTile[i][j].kanan = &myTile[i][j+1];
			else
				myTile[i][j].kanan = NULL;
			if(i>0)
				myTile[i][j].atas = &myTile[i-1][j];
			else
				myTile[i][j].atas = NULL;
			if(i<23)
				myTile[i][j].bawah = &myTile[i+1][j];
			else
				myTile[i][j].bawah =NULL;
		}
	}

	for(int i=0;i<15;i++)
	{
		myTile[i][35].character = '#';
		myTile[i][35].opened = true;
		myTile[i][35].visited = true;
	}

	//path
	vector<Tile*>openList;
	coord start;start.x = 5;start.y = 5;
	coord finish;finish.x = 50;finish.y = 5;
	openList.push_back(&myTile[start.y][start.x]);
	openList[0]->cost = 0;
	openList[0]->opened = true;
	while(openList.size()>0 && myTile[finish.y][finish.x].visited==false){
		for(int i=-1;i<=1;i++){
			for(int j=-1;j<=1;j++){
				if((i==0 || j==0) && !(i==0 && j==0)){
					if(openList[0]->y+i < 0)continue;
					if(openList[0]->y+i > 23)continue;
					if(openList[0]->x+j < 0)continue;
					if(openList[0]->x+j > 77)continue;
					if(myTile[openList[0]->y+i][openList[0]->x+j].opened==false &&
						myTile[openList[0]->y+i][openList[0]->x+j].visited==false)
					{
						myTile[openList[0]->y+i][openList[0]->x+j].parent
							= openList[0];
						myTile[openList[0]->y+i][openList[0]->x+j].cost
							= openList[0]->cost + 1;
						myTile[openList[0]->y+i][openList[0]->x+j].opened = true;
						bool inserted = false;
						for(int k=0;k<openList.size();k++){
							if(openList[k]->cost>
								myTile[openList[0]->y+i][openList[0]->x+j].cost)
							{
								openList.insert(openList.begin()+k,
									&myTile[openList[0]->y+i][openList[0]->x+j]);
								inserted = true;
								break;
							}
						}
						if(!inserted)
							openList.push_back(&myTile[openList[0]->y+i][openList[0]->x+j]);
					}
				}
			}
		}
		openList[0]->visited = true;
		openList.erase(openList.begin()+0);
	}

	coord path;
	path.y = finish.y;
	path.x = finish.x;
	while(myTile[path.y][path.x].parent!=NULL){
		myTile[path.y][path.x].character = '*';
		int nextY = myTile[path.y][path.x].parent->y;
		int nextX = myTile[path.y][path.x].parent->x;
		path.y = nextY;
		path.x = nextX;
	}


	for(int i=0;i<24;i++){
		for(int j=0;j<79;j++){
			printf("%c",myTile[i][j].character);
		}
		printf("\n");
	}
	getchar();
	return 0;
}
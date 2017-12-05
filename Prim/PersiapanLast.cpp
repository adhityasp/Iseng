#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<vector>

#define HEIGHT 3
#define WIDTH 3
struct point {
	int row, col;
};
struct waypoint {
	int from,to;
};

std::vector<int>frontier, walk;
std::vector<waypoint> way;

point *convertNumberToPoint(int number) {
	point *p = new point();
	p->col = number/ WIDTH;//x
	p->row = number % WIDTH;//y
	return p;
}

point *convertNumberToPointMap(int number) {
	point *p = new point();
	p->col = number / WIDTH *2 + 1;//x
	p->row = number % WIDTH * 2 + 1;//y
	return p;
}

int convertPointToNumber(int x, int y) {
	return y * WIDTH + x;
}

bool isNeighbour(point *from, point *to) {

	if (from->row + 1 == to->row && from->col == to->col)return true;
	if (from->row - 1 == to->row && from->col == to->col)return true;
	if (from->row == to->row && from->col + 1 == to->col)return true; 
	if (from->row == to->row && from->col - 1 == to->col)return true;
	return false;
}
bool isInFrontier(int number) {
	for (int i = 0; i < frontier.size(); i++)
	{
		if (frontier.at(i) == number)return true;
	}
	return false;
}

bool isInWalk(int number) {
	for (int i = 0; i < walk.size(); i++)
	{
		if (walk.at(i) == number)return true;
	}
	return false;
}

void addFrontier(int row, int col) {
	if (row + 1  < HEIGHT&& !isInFrontier(convertPointToNumber(row + 1, col)) && !isInWalk(convertPointToNumber(row + 1, col))){
		frontier.push_back(convertPointToNumber(row + 1, col));
	}
	if (row - 1 >= 0 && !isInFrontier(convertPointToNumber(row - 1, col)) && !isInWalk(convertPointToNumber(row - 1, col))) {
		frontier.push_back(convertPointToNumber(row - 1, col));
	}
	if (col + 1 < WIDTH && !isInFrontier(convertPointToNumber(row , col + 1)) && !isInWalk(convertPointToNumber(row , col + 1))) {
		frontier.push_back(convertPointToNumber(row, col + 1));
	}
	if (col - 1 >= 0 && !isInFrontier(convertPointToNumber(row, col - 1)) && !isInWalk(convertPointToNumber(row, col - 1))) {
		frontier.push_back(convertPointToNumber(row, col - 1));
	}
}

int main() {

	//1. tentukan titik awal & frontier awal
	walk.push_back(0);
	frontier.push_back(1);
	frontier.push_back(WIDTH);

	while (!frontier.empty()) {
		//2. pilih titik random untuk next step nya
		srand(time(NULL));
		int random = rand() % frontier.size();
		int pointBaru = frontier.at(random);
		//3. masukkan titik baru tersebut ke walk
		walk.push_back(pointBaru);
		//4. apus titik baru dari frontier
		frontier.erase(frontier.begin() + random);
		//5. cari frontier dari titik baru tersebut
		point *from;
		point *to = convertNumberToPoint(pointBaru);
		addFrontier(to->row, to->col);
		waypoint newWay;
		for (int i = 0; i < walk.size()-1; i++)
		{
			from = convertNumberToPoint(walk.at(i));
			//6. apabila titik random sebelahan dengan titik sbelumnya, maka masukkan ke way
			if (isNeighbour(from, to)) {
				newWay.from = walk.at(i);
				newWay.to = pointBaru;
				way.push_back(newWay);
				break;
			}
		}
	}

	char maze[HEIGHT * 2 + 1][WIDTH * 2 + 1];
	//printMap
	for (int i = 0; i < HEIGHT * 2 + 1; i++)
	{
		for (int j = 0; j < WIDTH * 2 + 1; j++)
		{
			maze[j][i] = '#';
		}
	}

	for (int i = 0; i < walk.size(); i++)
	{
		int row = convertNumberToPointMap(walk.at(i))->row;
		int col = convertNumberToPointMap(walk.at(i))->col;
		maze[row][col] = ' ';
	}

	for (int i = 0; i < way.size(); i++)
	{
		int row = (convertNumberToPointMap(way.at(i).from)->row + convertNumberToPointMap(way.at(i).to)->row) / 2;
		int col = (convertNumberToPointMap(way.at(i).from)->col + convertNumberToPointMap(way.at(i).to)->col) / 2;
		maze[row][col] = ' ';
	}

	for (int i = 0; i < HEIGHT * 2 + 1; i++)
	{
		for (int j = 0; j < WIDTH * 2 + 1; j++)
		{
			printf("%c", maze[j][i]);
		}
		printf("\n");
	}
	getchar();
	return 0;
}
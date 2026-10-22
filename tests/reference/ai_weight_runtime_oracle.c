/* Evaluation/scaling bodies retained from code/botlib/be_ai_weight.c. */
#include <stdio.h>
#define WT_BALANCE 1
typedef struct fuzzyseperator_s { int index,value,type; float weight,minweight,maxweight; struct fuzzyseperator_s *child,*next; } fuzzyseperator_t;
float FuzzyWeight_r(int *inventory, fuzzyseperator_t *fs)
{
	float scale, w1, w2;
	if (inventory[fs->index] < fs->value) { if (fs->child) return FuzzyWeight_r(inventory, fs->child); else return fs->weight; }
	else if (fs->next) {
		if (inventory[fs->index] < fs->next->value) {
			if (fs->child) w1 = FuzzyWeight_r(inventory, fs->child); else w1 = fs->weight;
			if (fs->next->child) w2 = FuzzyWeight_r(inventory, fs->next->child); else w2 = fs->next->weight;
			scale = (float)(inventory[fs->index] - fs->value) / (fs->next->value - fs->value);
			return scale * w1 + (1 - scale) * w2;
		}
		return FuzzyWeight_r(inventory, fs->next);
	}
	return fs->weight;
}
void ScaleFuzzySeperator_r(fuzzyseperator_t *fs, float scale)
{
	if (fs->child) { ScaleFuzzySeperator_r(fs->child, scale); }
	else if (fs->type == WT_BALANCE) { fs->weight = (fs->maxweight + fs->minweight) * scale; if (fs->weight < fs->minweight) fs->weight = fs->minweight; else if (fs->weight > fs->maxweight) fs->weight = fs->maxweight; }
	if (fs->next) ScaleFuzzySeperator_r(fs->next, scale);
}
void ScaleFuzzySeperatorBalanceRange_r(fuzzyseperator_t *fs, float scale)
{
	if (fs->child) { ScaleFuzzySeperatorBalanceRange_r(fs->child, scale); }
	else if (fs->type == WT_BALANCE) { float mid = (fs->minweight + fs->maxweight) * 0.5f; fs->maxweight = mid + (fs->maxweight - mid) * scale; fs->minweight = mid + (fs->minweight - mid) * scale; if (fs->maxweight < fs->minweight) fs->maxweight = fs->minweight; }
	if (fs->next) ScaleFuzzySeperatorBalanceRange_r(fs->next, scale);
}
int InterbreedFuzzySeperator_r(fuzzyseperator_t *fs1, fuzzyseperator_t *fs2, fuzzyseperator_t *fsout)
{
	if (fs1->child) { if (!fs2->child || !fsout->child) return 0; if (!InterbreedFuzzySeperator_r(fs2->child, fs2->child, fsout->child)) return 0; }
	else if (fs1->type == WT_BALANCE) { if (fs2->type != WT_BALANCE || fsout->type != WT_BALANCE) return 0; fsout->weight = (fs1->weight + fs2->weight) / 2; if (fsout->weight > fsout->maxweight) fsout->maxweight = fsout->weight; if (fsout->weight > fsout->minweight) fsout->minweight = fsout->weight; }
	if (fs1->next) { if (!fs2->next || !fsout->next) return 0; if (!InterbreedFuzzySeperator_r(fs1->next, fs2->next, fsout->next)) return 0; }
	return 1;
}
int main(void) {
  int inventory[1]={5}; fuzzyseperator_t b={0,10,WT_BALANCE,20,10,30,0,0}; fuzzyseperator_t a={0,0,WT_BALANCE,10,5,15,0,&b};
  printf("EVAL %.6g\n",FuzzyWeight_r(inventory,&a)); ScaleFuzzySeperator_r(&a,.5f); printf("SCALE %.6g %.6g\n",a.weight,b.weight); ScaleFuzzySeperatorBalanceRange_r(&a,.5f); printf("RANGE %.6g %.6g %.6g %.6g\n",a.minweight,a.maxweight,b.minweight,b.maxweight);
  { fuzzyseperator_t x={0,0,WT_BALANCE,4,0,8,0,0},y={0,0,WT_BALANCE,8,0,10,0,0},z={0,0,WT_BALANCE,0,1,2,0,0}; printf("BREED %d",InterbreedFuzzySeperator_r(&x,&y,&z)); printf(" %.6g %.6g %.6g\n",z.weight,z.minweight,z.maxweight); }
  return 0;
}

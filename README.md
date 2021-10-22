### 学習するまでにやること
- https://github.com/kan-bayashi/ParallelWaveGAN#a-use-pip に従ってインストール
- recipeをstep 2までやる
```
cd egs/ljspeech/voc1
# stageが-1から1までは学習用データのダウンロードとか前処理を行うためのレシピ
# わかりにくい。。。
./run.sh --stage -1 --stop_stage -1
./run.sh --stage 0 --stop_stage 0
./run.sh --stage 1 --stop_stage 1

# 学習実施
./run.sh --stage 2 --stop_stage 2
# これにより, ParallelWaveGAN/parallel_wavegan/bin/train.py が呼び出される
```

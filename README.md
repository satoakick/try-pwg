### 学習するまでにやること
- https://github.com/kan-bayashi/ParallelWaveGAN#a-use-pip に従ってインストール
- recipeをstep 2までやる

### 設定ファイル
使用するデータが/egs/ljspeech/voc1の場合、デフォルトは  
ParallelWaveGAN/egs/ljspeech/voc1/conf/parallel_wavegan.v1.yaml になる  

特にちょこっと動かすだけなら、train_max_stepsを10くらいにしてやれば簡単な動作検証ができる  

### 学習実行までのコマンドの手順
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

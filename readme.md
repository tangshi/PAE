Matlab demo for **"Photographic Appearance Enhancement via Detail-based Dictionary Learning"**

## Abstract
 
 A number of edge-aware filters can efficiently boost the appearance of an image by detail decomposition and enhancement. However, they often fail to produce photographic enhanced appearance due to some visible artifacts, especially noise, halos and unnatural contrast. The essential reason is that the guidance and constraint of high-quality appearance aren't enough sufficient in the process of enhancement. Thus our idea is to train a detail dictionary from a lot of high-quality patches in order to constrain and control the entire appearance enhancement. In this paper, we propose a novel learning-based enhancement method for photographic appearance, which includes two main stages: dictionary training and sparse reconstruction. In the training stage, we construct a training set of detail patches by extracting from some high-quality photos, and then train an overcomplete detail dictionary by iteratively minimizing an L1-norm energy function. In the reconstruction stage, we employ the trained dictionary to reconstruct the boosted detail layer, and further formalize a gradient-guided optimization function to improve the local coherence between patches. Moreover, we propose two evaluation metrics to measure the performance of appearance enhancement. The final experimental results have demonstrated the effectiveness of our learning-based enhancement method.

## Usage

`demo.m` - run an example to see the result shown in the paper.

`sparse_reconstruction.p` - reconstruct a new boosted detail layer. (Note: the initial boosted detail layer is derived from guided filter)

`detail_optimization.p` - optimize the detail layer for local coherence.

`dictionary.mat` - a trained detail dictionary.

`EME.m` - compute EME value of an image.

## Reference

If you use this code in your own work, please cite the following [paper](http://jcst.ict.ac.cn:8080/jcst/EN/10.1007/s11390-017-1733-z): Zhi-Feng Xie, Shi Tang, Dong-Jin Huang, You-Dong Ding, Li-Zhuang Ma.Photographic Appearance Enhancement via Detail-based Dictionary Learning[J]  Journal of Computer Science and Technology, 2017,V32(3): 417-429

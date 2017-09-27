NB. 2-2-2 ANN

NB. Input matrix: denoted X
NB.   row per minibatch
NB.   col per feature

NB. Weight matrix: From layer i to j is denoted Wij
NB.   nth column of the mth row represents the weight from the
NB.   nth neuron of previous layer to the mth neuron of next layer.

NB. Bias list: For layer i, denoted Bi
NB.   nth element represents bias in the nth neuron of layer i

NB. S1 = X mmu W01
NB. Z1 = sigmoid B1 +"1 S1
NB. Sj = Zi mmu Wij
NB. Zj = sigmoid Bj +"1 Sj

layersizes=:2 2 2
X  =:(1,(0{layersizes)) $ 0.05 0.1
W01=:(0 1 { layersizes) $ 0.15 0.25 0.20 0.3
B1 =:(1,(1{layersizes)) $ 0.35 0.35
W12=:(1 2 { layersizes) $ 0.4 0.5 0.45 0.55
B2 =:(1,(2{layersizes)) $ 0.6 0.6
nn=:<"1 (W01;B1),:(W12;B2)

target=:0.01 0.99

mmu=:+/ .*
softmax=:^ % +/@:^
sigmoid=:^ % >:@:^

layer=:>@:{~ NB. 'nn layer 0' Gets the weights and biases of the first hidden layer.
w=:>@:(0&{) NB. weights. Call on the result of 'layer'
b=:>@:(1&{) NB. biases.  Call on the result of 'layer'

S=:mmu w
Z=:sigmoid@:(b@:] +"1 S)

feedThroughLayer=:Z nn&layer

outputError=:(+/"1)@:-:@:*:@:(-"1)
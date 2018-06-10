function layers = makeWeightedBarsoumNet(imSize, classNames, classWeights)

    layers = [
        imageInputLayer(imSize) ...
        ...
        convolution2dLayer([3, 3], 64, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 64, 'Padding', 'same') ...
        maxPooling2dLayer([2, 2], 'Stride', [2, 2]) ...
        dropoutLayer(0.25) ...
        ...
        convolution2dLayer([3, 3], 128, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 128, 'Padding', 'same') ...
        maxPooling2dLayer([2, 2], 'Stride', [2, 2]) ...
        dropoutLayer(0.25) ...
        ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        maxPooling2dLayer([2, 2], 'Stride', [2, 2]) ...
        dropoutLayer(0.25) ...
        ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        convolution2dLayer([3, 3], 256, 'Padding', 'same') ...
        maxPooling2dLayer([2, 2], 'Stride', [2, 2]) ...
        dropoutLayer(0.25) ...
        ...
        fullyConnectedLayer(1024) ...
        reluLayer ...
        dropoutLayer(0.5) ...
        ...
        fullyConnectedLayer(numel(classNames))...
        softmaxLayer() ...
        weightedCrossEntropyLayer(classNames, classWeights)
    ];
end

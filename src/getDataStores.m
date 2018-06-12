function [train, val, test] = getDataStores()
    dataRoot = 'data';
    train = imageDatastore(fullfile(dataRoot, 'Training'), ...
                            'IncludeSubfolders', true, ...
                            'LabelSource', 'foldernames');
    val = imageDatastore(fullfile(dataRoot, 'PublicTest'), ...
                            'IncludeSubfolders', true, ...
                            'LabelSource', 'foldernames');
    test = imageDatastore(fullfile(dataRoot, 'PrivateTest'), ...
                            'IncludeSubfolders', true, ...
                            'LabelSource', 'foldernames');
end
% Author: Gizem Kucukoglu
% April 2015

function render_test()

%% Render spheron imagefor test

% Setup conditions file
fixed1 = 0.2;
fixed2 = 0.5;
diffuse = 'mccBabel-16.spd';

% ro_s = ['300:',num2str(fixed1),' 800:',num2str(fixed1)];
% %ro_d = diffuse;
% ro_d = ['300:', num2str(fixed2), ' 800:', num2str(fixed2)];
alphau = 0.3; % alphau and alphav should always be the same value for isotropic brdf
% % rotz = 0.5;

%% for rgb rendering
% ro_s = [num2str(fixed1),',',num2str(fixed1),',',num2str(fixed1)];
% ro_d = [num2str(fixed2),',',num2str(fixed2),',',num2str(fixed2)];

%% for monochromatic rendering
ro_s = 0.5;
ro_d = 0.4;
% for i=1.0:0.5:10
%     rotz = i;
%     mycell2 = {ro_s, ro_d, alphau, rotz};
%     mycell = [mycell;mycell2]
% end

mycell = {ro_s, ro_d, alphau};

T = cell2table(mycell, 'VariableNames', {'ro_s' 'ro_d' 'alphau'});
writetable(T,'/scratch/gk925/hpc_brdf_spheron_test/spheron_Conditions.txt','Delimiter','\t')
% 

%%
% Set preferences
%setpref('RenderToolbox3', 'workingFolder', '/Users/gizem/Documents/Research/hpc_brdf_spheron_test');

setpref('RenderToolbox3', 'workingFolder', '/scratch/gk925/hpc_brdf_spheron_test');

% use this scene and condition file.
parentSceneFile = 'spheron_sphere6.dae';
conditionsFile = 'spheron_Conditions.txt';
mappingsFile = 'spheron_sphereDefaultMappings.txt';

% Make sure all illuminants are added to the path.
addpath(genpath(pwd))

% which materials to use, [] means all
hints.whichConditions = [];

% Choose batch renderer options.
hints.imageWidth = 5414;
hints.imageHeight = 2707;
datetime=datestr(now);
datetime=strrep(datetime,':','_'); %Replace colon with underscore
datetime=strrep(datetime,'-','_');%Replace minus sign with underscore
datetime=strrep(datetime,' ','_');%Replace space with underscore
hints.recipeName = ['Spheron-test-', datetime];

ChangeToWorkingFolder(hints);

%comment all this out
toneMapFactor = 10;
isScale = true;

for renderer = {'Mitsuba'}
    
    % choose one renderer
    hints.renderer = renderer{1};
    
    % make 3 multi-spectral renderings, saved in .mat files
    nativeSceneFiles = MakeSceneFiles(parentSceneFile, conditionsFile, mappingsFile, hints);
    radianceDataFiles = BatchRender(nativeSceneFiles, hints);
    
    % condense multi-spectral renderings into one sRGB montage
    montageName = sprintf('Spheron-test');
    montageFile = [montageName '.png'];
    [SRGBMontage, XYZMontage] = ...
        MakeMontage(radianceDataFiles, montageFile, toneMapFactor, isScale, hints);
%     save('SRGBMontage.mat','SRGBMontage');
    % display the sRGB montage
    %ShowXYZAndSRGB([], SRGBMontage, montageName);
end
% load('renderings/Mitsuba/spheron_sphere4-001.mat')
% [sRGBImage, XYZImage, rawRGBImage] = MultispectralToSRGB(multispectralImage, S);
% save('rawRGBImage.mat','rawRGBImage');





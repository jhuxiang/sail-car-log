% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2221.832992308238317 ; 2233.725459219533150 ];

%-- Principal point:
cc = [ 623.690376969218278 ; 445.694560591249910 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.114526354248325 ; -0.229505575897536 ; -0.000447806267288 ; -0.003944409531376 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 11.647163103226122 ; 11.742522455233138 ];

%-- Principal point uncertainty:
cc_error = [ 13.610666664581499 ; 11.870599801733110 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.016576045409902 ; 0.171974042690659 ; 0.001116497506270 ; 0.001369482511920 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 78;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.920218e+00 ; 1.782507e+00 ; -4.996806e-01 ];
Tc_1  = [ -2.445749e+03 ; 2.079741e+02 ; 1.124790e+04 ];
omc_error_1 = [ 3.843023e-03 ; 5.721837e-03 ; 8.796749e-03 ];
Tc_error_1  = [ 6.894413e+01 ; 6.042161e+01 ; 6.130413e+01 ];

%-- Image #2:
omc_2 = [ 1.853943e+00 ; 1.662623e+00 ; -4.339742e-01 ];
Tc_2  = [ -2.322415e+03 ; 2.366818e+02 ; 9.735081e+03 ];
omc_error_2 = [ 3.778620e-03 ; 5.404843e-03 ; 8.034780e-03 ];
Tc_error_2  = [ 5.970329e+01 ; 5.242719e+01 ; 5.339405e+01 ];

%-- Image #3:
omc_3 = [ 1.901552e+00 ; 1.749719e+00 ; -4.655582e-01 ];
Tc_3  = [ -1.844436e+03 ; 2.426780e+02 ; 9.239353e+03 ];
omc_error_3 = [ 3.787672e-03 ; 5.357321e-03 ; 8.298928e-03 ];
Tc_error_3  = [ 5.663529e+01 ; 4.953684e+01 ; 4.956114e+01 ];

%-- Image #4:
omc_4 = [ 1.832356e+00 ; 1.752872e+00 ; -6.282738e-01 ];
Tc_4  = [ -1.127669e+03 ; 2.473039e+02 ; 9.168697e+03 ];
omc_error_4 = [ 3.757819e-03 ; 5.328316e-03 ; 7.992807e-03 ];
Tc_error_4  = [ 5.617738e+01 ; 4.885936e+01 ; 4.780530e+01 ];

%-- Image #5:
omc_5 = [ 1.964627e+00 ; 1.862041e+00 ; -5.487416e-01 ];
Tc_5  = [ -3.460825e+02 ; 2.040875e+02 ; 8.961036e+03 ];
omc_error_5 = [ 4.096032e-03 ; 5.126949e-03 ; 8.831020e-03 ];
Tc_error_5  = [ 5.489290e+01 ; 4.760601e+01 ; 4.672333e+01 ];

%-- Image #6:
omc_6 = [ 2.232791e+00 ; 2.151045e+00 ; -4.787143e-01 ];
Tc_6  = [ -3.188075e+02 ; 1.708894e+02 ; 8.474066e+03 ];
omc_error_6 = [ 5.056205e-03 ; 5.561927e-03 ; 1.127940e-02 ];
Tc_error_6  = [ 5.185441e+01 ; 4.501068e+01 ; 4.411228e+01 ];

%-- Image #7:
omc_7 = [ -1.972178e+00 ; -1.919460e+00 ; -3.372003e-01 ];
Tc_7  = [ -7.995088e+02 ; 2.133013e+02 ; 8.068481e+03 ];
omc_error_7 = [ 3.913531e-03 ; 5.284386e-03 ; 8.722146e-03 ];
Tc_error_7  = [ 4.943494e+01 ; 4.296045e+01 ; 4.341637e+01 ];

%-- Image #8:
omc_8 = [ -1.775910e+00 ; -1.792745e+00 ; -5.617632e-01 ];
Tc_8  = [ -8.292323e+02 ; 2.735689e+02 ; 7.980092e+03 ];
omc_error_8 = [ 3.741722e-03 ; 5.455710e-03 ; 7.679397e-03 ];
Tc_error_8  = [ 4.890231e+01 ; 4.251173e+01 ; 4.333585e+01 ];

%-- Image #9:
omc_9 = [ 1.918770e+00 ; 1.811224e+00 ; -5.503641e-01 ];
Tc_9  = [ -7.132356e+02 ; 1.966777e+02 ; 8.696267e+03 ];
omc_error_9 = [ 3.923962e-03 ; 5.145406e-03 ; 8.418249e-03 ];
Tc_error_9  = [ 5.326758e+01 ; 4.624693e+01 ; 4.529306e+01 ];

%-- Image #10:
omc_10 = [ 1.692928e+00 ; 1.585926e+00 ; -8.367868e-01 ];
Tc_10  = [ -7.072243e+02 ; 2.681712e+02 ; 8.855551e+03 ];
omc_error_10 = [ 4.006884e-03 ; 5.430294e-03 ; 7.202835e-03 ];
Tc_error_10  = [ 5.425325e+01 ; 4.708891e+01 ; 4.555013e+01 ];

%-- Image #11:
omc_11 = [ 2.036047e+00 ; 1.948023e+00 ; 3.187108e-02 ];
Tc_11  = [ -5.291921e+02 ; 9.331962e+01 ; 9.863415e+03 ];
omc_error_11 = [ 5.543764e-03 ; 5.509223e-03 ; 1.142207e-02 ];
Tc_error_11  = [ 6.038316e+01 ; 5.242815e+01 ; 5.410345e+01 ];

%-- Image #12:
omc_12 = [ -2.199793e+00 ; -2.217390e+00 ; 5.957875e-02 ];
Tc_12  = [ -1.086361e+03 ; 7.406165e+01 ; 1.193570e+04 ];
omc_error_12 = [ 1.355004e-02 ; 1.402897e-02 ; 3.023584e-02 ];
Tc_error_12  = [ 7.308641e+01 ; 6.350387e+01 ; 6.410272e+01 ];

%-- Image #13:
omc_13 = [ -2.230325e+00 ; -2.142808e+00 ; -5.645978e-03 ];
Tc_13  = [ -2.452894e+03 ; 1.960637e+02 ; 1.317035e+04 ];
omc_error_13 = [ 9.065521e-03 ; 8.517879e-03 ; 1.926208e-02 ];
Tc_error_13  = [ 8.096848e+01 ; 7.052884e+01 ; 7.254448e+01 ];

%-- Image #14:
omc_14 = [ 2.178906e+00 ; 2.169149e+00 ; -2.199970e-01 ];
Tc_14  = [ 6.383541e+02 ; 5.771129e+01 ; 1.321896e+04 ];
omc_error_14 = [ 1.310951e-02 ; 1.210690e-02 ; 2.794451e-02 ];
Tc_error_14  = [ 8.110027e+01 ; 7.030030e+01 ; 7.258907e+01 ];

%-- Image #15:
omc_15 = [ -2.194047e+00 ; -2.170694e+00 ; 2.078146e-01 ];
Tc_15  = [ 1.437397e+03 ; 6.074183e+01 ; 1.314108e+04 ];
omc_error_15 = [ 2.337388e-02 ; 2.801284e-02 ; 6.172141e-02 ];
Tc_error_15  = [ 8.117808e+01 ; 7.010559e+01 ; 7.588172e+01 ];

%-- Image #16:
omc_16 = [ -2.139373e+00 ; -2.066441e+00 ; 2.588337e-01 ];
Tc_16  = [ -8.599508e+02 ; 1.332564e+02 ; 7.355285e+03 ];
omc_error_16 = [ 5.143848e-03 ; 4.810949e-03 ; 9.815869e-03 ];
Tc_error_16  = [ 4.499745e+01 ; 3.916312e+01 ; 3.875700e+01 ];

%-- Image #17:
omc_17 = [ -1.960442e+00 ; -1.951396e+00 ; -2.067297e-01 ];
Tc_17  = [ -8.383895e+02 ; 9.628993e+01 ; 7.040377e+03 ];
omc_error_17 = [ 3.970482e-03 ; 5.093380e-03 ; 8.574561e-03 ];
Tc_error_17  = [ 4.312702e+01 ; 3.750610e+01 ; 3.771361e+01 ];

%-- Image #18:
omc_18 = [ -1.646719e+00 ; -1.706946e+00 ; -5.891970e-01 ];
Tc_18  = [ -8.001413e+02 ; 2.238334e+02 ; 6.766737e+03 ];
omc_error_18 = [ 3.820082e-03 ; 5.495143e-03 ; 7.032629e-03 ];
Tc_error_18  = [ 4.146482e+01 ; 3.606789e+01 ; 3.688256e+01 ];

%-- Image #19:
omc_19 = [ 1.589965e+00 ; 1.595264e+00 ; -7.516222e-01 ];
Tc_19  = [ -1.134699e+03 ; 1.705786e+02 ; 7.415625e+03 ];
omc_error_19 = [ 3.789409e-03 ; 5.465686e-03 ; 6.907583e-03 ];
Tc_error_19  = [ 4.543872e+01 ; 3.957984e+01 ; 3.832127e+01 ];

%-- Image #20:
omc_20 = [ 1.575494e+00 ; 1.631282e+00 ; -8.241767e-01 ];
Tc_20  = [ -1.852974e+03 ; 2.188583e+02 ; 7.730644e+03 ];
omc_error_20 = [ 3.452499e-03 ; 5.699036e-03 ; 7.064089e-03 ];
Tc_error_20  = [ 4.738522e+01 ; 4.163145e+01 ; 4.127173e+01 ];

%-- Image #21:
omc_21 = [ 2.267301e+00 ; 2.145221e+00 ; -1.295134e-01 ];
Tc_21  = [ -1.633129e+03 ; 1.091093e+02 ; 7.235831e+03 ];
omc_error_21 = [ 5.724496e-03 ; 6.142788e-03 ; 1.276038e-02 ];
Tc_error_21  = [ 4.445358e+01 ; 3.888315e+01 ; 3.946916e+01 ];

%-- Image #22:
omc_22 = [ -2.202633e+00 ; -2.160740e+00 ; 1.693660e-02 ];
Tc_22  = [ -9.352735e+02 ; -4.522685e+02 ; 6.994510e+03 ];
omc_error_22 = [ 7.090499e-03 ; 6.690430e-03 ; 1.533747e-02 ];
Tc_error_22  = [ 4.284534e+01 ; 3.727710e+01 ; 3.752154e+01 ];

%-- Image #23:
omc_23 = [ 2.209784e+00 ; 2.178900e+00 ; -6.480465e-03 ];
Tc_23  = [ -3.156036e+02 ; -4.765450e+02 ; 6.743422e+03 ];
omc_error_23 = [ 7.718791e-03 ; 7.697585e-03 ; 1.763883e-02 ];
Tc_error_23  = [ 4.135374e+01 ; 3.582161e+01 ; 3.659459e+01 ];

%-- Image #24:
omc_24 = [ 1.574194e+00 ; 1.612196e+00 ; -1.005967e+00 ];
Tc_24  = [ -9.531081e+02 ; -1.865784e+02 ; 7.158107e+03 ];
omc_error_24 = [ 3.916423e-03 ; 5.801473e-03 ; 6.934962e-03 ];
Tc_error_24  = [ 4.385264e+01 ; 3.815706e+01 ; 3.635684e+01 ];

%-- Image #25:
omc_25 = [ -1.720146e+00 ; -1.570403e+00 ; -8.511039e-01 ];
Tc_25  = [ -1.058927e+03 ; 3.225914e+02 ; 6.232884e+03 ];
omc_error_25 = [ 4.136363e-03 ; 5.439660e-03 ; 7.052719e-03 ];
Tc_error_25  = [ 3.821933e+01 ; 3.334021e+01 ; 3.465881e+01 ];

%-- Image #26:
omc_26 = [ -1.221675e+00 ; -2.782082e+00 ; 2.209848e-01 ];
Tc_26  = [ -4.279120e+02 ; -6.421257e+02 ; 6.779581e+03 ];
omc_error_26 = [ 3.455749e-03 ; 6.705595e-03 ; 1.035537e-02 ];
Tc_error_26  = [ 4.152043e+01 ; 3.602692e+01 ; 3.637692e+01 ];

%-- Image #27:
omc_27 = [ -1.016507e+00 ; -2.911949e+00 ; 4.327299e-01 ];
Tc_27  = [ 2.186918e+02 ; -6.009165e+02 ; 6.870916e+03 ];
omc_error_27 = [ 3.336409e-03 ; 6.255743e-03 ; 1.021783e-02 ];
Tc_error_27  = [ 4.211599e+01 ; 3.652103e+01 ; 3.642379e+01 ];

%-- Image #28:
omc_28 = [ 8.775687e-01 ; 2.203315e+00 ; -7.202095e-01 ];
Tc_28  = [ -1.442372e+03 ; -1.508038e+02 ; 7.656334e+03 ];
omc_error_28 = [ 2.527328e-03 ; 6.188722e-03 ; 7.001568e-03 ];
Tc_error_28  = [ 4.694511e+01 ; 4.101409e+01 ; 3.954783e+01 ];

%-- Image #29:
omc_29 = [ 9.595883e-01 ; 2.220726e+00 ; -4.425237e-01 ];
Tc_29  = [ -1.029447e+03 ; -1.522566e+02 ; 7.805880e+03 ];
omc_error_29 = [ 2.632456e-03 ; 6.013029e-03 ; 7.225168e-03 ];
Tc_error_29  = [ 4.782686e+01 ; 4.163928e+01 ; 4.038263e+01 ];

%-- Image #30:
omc_30 = [ 9.609371e-01 ; 2.248390e+00 ; -6.393939e-01 ];
Tc_30  = [ -6.047199e+02 ; -1.292086e+02 ; 8.234383e+03 ];
omc_error_30 = [ 2.743016e-03 ; 6.119996e-03 ; 7.294980e-03 ];
Tc_error_30  = [ 5.040162e+01 ; 4.380737e+01 ; 4.203138e+01 ];

%-- Image #31:
omc_31 = [ 1.000829e+00 ; 2.011233e+00 ; -4.021111e-01 ];
Tc_31  = [ -2.415712e+02 ; -1.319749e+02 ; 8.284992e+03 ];
omc_error_31 = [ 3.415752e-03 ; 5.903756e-03 ; 6.641491e-03 ];
Tc_error_31  = [ 5.069223e+01 ; 4.403648e+01 ; 4.312286e+01 ];

%-- Image #32:
omc_32 = [ 1.016862e+00 ; 2.029552e+00 ; -5.832957e-01 ];
Tc_32  = [ 2.660694e+02 ; -1.623281e+02 ; 8.111619e+03 ];
omc_error_32 = [ 3.525606e-03 ; 5.967276e-03 ; 6.661995e-03 ];
Tc_error_32  = [ 4.968876e+01 ; 4.313296e+01 ; 4.213262e+01 ];

%-- Image #33:
omc_33 = [ 9.859827e-01 ; 2.403573e+00 ; -1.063724e+00 ];
Tc_33  = [ 6.416583e+01 ; -1.031949e+02 ; 9.338333e+03 ];
omc_error_33 = [ 2.938286e-03 ; 6.419305e-03 ; 7.764748e-03 ];
Tc_error_33  = [ 5.717627e+01 ; 4.963899e+01 ; 4.763242e+01 ];

%-- Image #34:
omc_34 = [ 8.552524e-01 ; 2.552790e+00 ; -1.105216e+00 ];
Tc_34  = [ 8.252488e+01 ; -5.244844e+01 ; 1.034660e+04 ];
omc_error_34 = [ 2.865242e-03 ; 6.576603e-03 ; 8.093197e-03 ];
Tc_error_34  = [ 6.335102e+01 ; 5.500058e+01 ; 5.328890e+01 ];

%-- Image #35:
omc_35 = [ 9.973996e-01 ; 2.053685e+00 ; -5.281324e-01 ];
Tc_35  = [ -1.832052e+03 ; -5.640160e+01 ; 9.850206e+03 ];
omc_error_35 = [ 2.903147e-03 ; 6.107687e-03 ; 6.972049e-03 ];
Tc_error_35  = [ 6.045987e+01 ; 5.275682e+01 ; 5.180250e+01 ];

%-- Image #36:
omc_36 = [ 9.207677e-01 ; 2.723147e+00 ; -9.403808e-01 ];
Tc_36  = [ 4.250746e+02 ; -2.308856e+02 ; 8.618566e+03 ];
omc_error_36 = [ 2.309064e-03 ; 6.490591e-03 ; 8.641732e-03 ];
Tc_error_36  = [ 5.278103e+01 ; 4.585903e+01 ; 4.460012e+01 ];

%-- Image #37:
omc_37 = [ 2.242717e+00 ; 2.105203e+00 ; 8.317345e-02 ];
Tc_37  = [ -6.608828e+02 ; -1.218056e+03 ; 1.047463e+04 ];
omc_error_37 = [ 9.564344e-03 ; 1.036992e-02 ; 2.249405e-02 ];
Tc_error_37  = [ 6.433473e+01 ; 5.581596e+01 ; 5.801215e+01 ];

%-- Image #38:
omc_38 = [ 1.891916e+00 ; 2.035555e+00 ; -2.764426e-01 ];
Tc_38  = [ -4.989538e+02 ; -1.615816e+03 ; 1.051984e+04 ];
omc_error_38 = [ 4.133524e-03 ; 5.955439e-03 ; 9.762685e-03 ];
Tc_error_38  = [ 6.484712e+01 ; 5.620595e+01 ; 5.707065e+01 ];

%-- Image #39:
omc_39 = [ 1.714633e+00 ; 1.915070e+00 ; -5.326108e-01 ];
Tc_39  = [ -1.249389e+03 ; -1.646891e+03 ; 1.073735e+04 ];
omc_error_39 = [ 3.632006e-03 ; 6.002228e-03 ; 8.432091e-03 ];
Tc_error_39  = [ 6.620752e+01 ; 5.751488e+01 ; 5.803832e+01 ];

%-- Image #40:
omc_40 = [ 1.855078e+00 ; 2.018201e+00 ; -3.833092e-01 ];
Tc_40  = [ -2.092846e+03 ; -1.669678e+03 ; 1.044349e+04 ];
omc_error_40 = [ 3.409962e-03 ; 6.164168e-03 ; 9.623191e-03 ];
Tc_error_40  = [ 6.452129e+01 ; 5.627937e+01 ; 5.846845e+01 ];

%-- Image #41:
omc_41 = [ 1.872225e+00 ; 2.399726e+00 ; -2.603861e-01 ];
Tc_41  = [ -7.977078e+01 ; -1.654508e+03 ; 9.933357e+03 ];
omc_error_41 = [ 4.444074e-03 ; 7.096897e-03 ; 1.235846e-02 ];
Tc_error_41  = [ 6.133833e+01 ; 5.305902e+01 ; 5.409184e+01 ];

%-- Image #42:
omc_42 = [ 9.146501e-01 ; 2.605355e+00 ; -4.613978e-01 ];
Tc_42  = [ -5.934113e+02 ; -1.779740e+03 ; 1.066539e+04 ];
omc_error_42 = [ 2.231720e-03 ; 6.991908e-03 ; 9.160649e-03 ];
Tc_error_42  = [ 6.580507e+01 ; 5.701647e+01 ; 5.736702e+01 ];

%-- Image #43:
omc_43 = [ 7.666533e-01 ; 2.775150e+00 ; -1.530519e-01 ];
Tc_43  = [ -1.540833e+03 ; -1.722659e+03 ; 1.026123e+04 ];
omc_error_43 = [ 1.818183e-03 ; 8.937598e-03 ; 1.185189e-02 ];
Tc_error_43  = [ 6.337784e+01 ; 5.495110e+01 ; 5.701776e+01 ];

%-- Image #44:
omc_44 = [ NaN ; NaN ; NaN ];
Tc_44  = [ NaN ; NaN ; NaN ];
omc_error_44 = [ NaN ; NaN ; NaN ];
Tc_error_44  = [ NaN ; NaN ; NaN ];

%-- Image #45:
omc_45 = [ NaN ; NaN ; NaN ];
Tc_45  = [ NaN ; NaN ; NaN ];
omc_error_45 = [ NaN ; NaN ; NaN ];
Tc_error_45  = [ NaN ; NaN ; NaN ];

%-- Image #46:
omc_46 = [ -1.054843e+00 ; -2.828334e+00 ; -7.852366e-01 ];
Tc_46  = [ -1.608577e+03 ; -1.441201e+03 ; 9.177318e+03 ];
omc_error_46 = [ 2.903879e-03 ; 6.701506e-03 ; 1.047240e-02 ];
Tc_error_46  = [ 5.668183e+01 ; 4.925725e+01 ; 5.379111e+01 ];

%-- Image #47:
omc_47 = [ -5.273760e-01 ; -3.059112e+00 ; 1.945079e-01 ];
Tc_47  = [ -5.565159e+02 ; -1.389620e+03 ; 8.160878e+03 ];
omc_error_47 = [ 2.550369e-03 ; 7.984907e-03 ; 1.204348e-02 ];
Tc_error_47  = [ 5.039431e+01 ; 4.348410e+01 ; 4.486547e+01 ];

%-- Image #48:
omc_48 = [ 2.171263e+00 ; 2.275192e+00 ; -9.807781e-03 ];
Tc_48  = [ -8.969953e+02 ; -4.165362e+01 ; 1.170882e+04 ];
omc_error_48 = [ 1.943094e-02 ; 2.007079e-02 ; 4.338440e-02 ];
Tc_error_48  = [ 7.172611e+01 ; 6.226986e+01 ; 6.385326e+01 ];

%-- Image #49:
omc_49 = [ 2.068560e+00 ; 2.165156e+00 ; 1.317275e-01 ];
Tc_49  = [ -1.038355e+03 ; -7.335753e+02 ; 1.187065e+04 ];
omc_error_49 = [ 9.240211e-03 ; 1.091241e-02 ; 2.144887e-02 ];
Tc_error_49  = [ 7.272418e+01 ; 6.317689e+01 ; 6.672181e+01 ];

%-- Image #50:
omc_50 = [ 2.145367e+00 ; 2.190014e+00 ; 1.146315e-01 ];
Tc_50  = [ -3.055557e+03 ; -7.053872e+02 ; 1.321240e+04 ];
omc_error_50 = [ 1.470391e-02 ; 1.828050e-02 ; 3.620325e-02 ];
Tc_error_50  = [ 8.134228e+01 ; 7.108230e+01 ; 7.429229e+01 ];

%-- Image #51:
omc_51 = [ -2.178154e+00 ; -2.062287e+00 ; 3.790558e-02 ];
Tc_51  = [ -7.998266e+02 ; -4.675013e+02 ; 1.687783e+04 ];
omc_error_51 = [ 1.263544e-02 ; 1.263374e-02 ; 2.683179e-02 ];
Tc_error_51  = [ 1.033464e+02 ; 8.972000e+01 ; 9.319762e+01 ];

%-- Image #52:
omc_52 = [ -2.143157e+00 ; -2.024836e+00 ; 1.435917e-01 ];
Tc_52  = [ 1.914487e+03 ; -4.384073e+02 ; 1.609420e+04 ];
omc_error_52 = [ 1.958689e-02 ; 2.263075e-02 ; 4.482862e-02 ];
Tc_error_52  = [ 9.854312e+01 ; 8.595257e+01 ; 9.339462e+01 ];

%-- Image #53:
omc_53 = [ -2.015222e+00 ; -1.870023e+00 ; 3.874563e-01 ];
Tc_53  = [ 1.430528e+03 ; -4.214283e+02 ; 1.350589e+04 ];
omc_error_53 = [ 6.233670e-03 ; 6.320488e-03 ; 1.154857e-02 ];
Tc_error_53  = [ 8.323563e+01 ; 7.203736e+01 ; 7.427178e+01 ];

%-- Image #54:
omc_54 = [ -2.091403e+00 ; -2.009386e+00 ; 1.597051e-01 ];
Tc_54  = [ -7.695514e+02 ; -2.697334e+02 ; 9.762723e+03 ];
omc_error_54 = [ 5.506576e-03 ; 5.376330e-03 ; 1.092135e-02 ];
Tc_error_54  = [ 5.973805e+01 ; 5.190791e+01 ; 5.198129e+01 ];

%-- Image #55:
omc_55 = [ -2.161133e+00 ; -2.180371e+00 ; -9.029045e-02 ];
Tc_55  = [ -6.170121e+02 ; -2.789262e+02 ; 7.519636e+03 ];
omc_error_55 = [ 7.442208e-03 ; 7.968484e-03 ; 1.628057e-02 ];
Tc_error_55  = [ 4.607999e+01 ; 4.000428e+01 ; 4.065028e+01 ];

%-- Image #56:
omc_56 = [ -2.220803e+00 ; -2.195072e+00 ; -2.768582e-02 ];
Tc_56  = [ -6.106670e+02 ; -2.573409e+02 ; 6.168693e+03 ];
omc_error_56 = [ 7.711251e-03 ; 7.786636e-03 ; 1.677096e-02 ];
Tc_error_56  = [ 3.781384e+01 ; 3.283227e+01 ; 3.320737e+01 ];

%-- Image #57:
omc_57 = [ -2.366793e+00 ; -2.035768e+00 ; -6.600850e-02 ];
Tc_57  = [ -1.460960e+03 ; -1.858537e+02 ; 6.110698e+03 ];
omc_error_57 = [ 6.570632e-03 ; 5.195395e-03 ; 1.407431e-02 ];
Tc_error_57  = [ 3.747933e+01 ; 3.284766e+01 ; 3.377577e+01 ];

%-- Image #58:
omc_58 = [ -2.328345e+00 ; -2.066331e+00 ; -1.548142e-02 ];
Tc_58  = [ -1.134757e+03 ; -2.188174e+02 ; 6.079164e+03 ];
omc_error_58 = [ 6.534275e-03 ; 5.533541e-03 ; 1.392238e-02 ];
Tc_error_58  = [ 3.724825e+01 ; 3.250111e+01 ; 3.288055e+01 ];

%-- Image #59:
omc_59 = [ -2.447542e+00 ; -1.954884e+00 ; -6.411913e-02 ];
Tc_59  = [ -6.389458e+02 ; -6.961039e+01 ; 6.005916e+03 ];
omc_error_59 = [ 7.582417e-03 ; 6.327778e-03 ; 1.575620e-02 ];
Tc_error_59  = [ 3.682458e+01 ; 3.196475e+01 ; 3.237639e+01 ];

%-- Image #60:
omc_60 = [ -2.646474e+00 ; -1.602279e+00 ; 8.223088e-02 ];
Tc_60  = [ -7.501769e+02 ; 6.634781e+01 ; 6.080456e+03 ];
omc_error_60 = [ 7.076316e-03 ; 4.291982e-03 ; 1.387442e-02 ];
Tc_error_60  = [ 3.721325e+01 ; 3.233146e+01 ; 3.208756e+01 ];

%-- Image #61:
omc_61 = [ -2.846805e+00 ; -9.849913e-01 ; 1.425900e-01 ];
Tc_61  = [ -1.116301e+03 ; 2.539457e+02 ; 6.091023e+03 ];
omc_error_61 = [ 6.065167e-03 ; 1.793736e-03 ; 1.084235e-02 ];
Tc_error_61  = [ 3.732708e+01 ; 3.250122e+01 ; 3.193509e+01 ];

%-- Image #62:
omc_62 = [ 2.874996e+00 ; 4.279042e-01 ; 2.396897e-01 ];
Tc_62  = [ -1.323803e+03 ; 5.110439e+02 ; 5.955323e+03 ];
omc_error_62 = [ 6.883438e-03 ; 1.829098e-03 ; 1.112155e-02 ];
Tc_error_62  = [ 3.664407e+01 ; 3.199788e+01 ; 3.288044e+01 ];

%-- Image #63:
omc_63 = [ 2.955701e+00 ; 2.622282e-02 ; 1.141389e-01 ];
Tc_63  = [ -1.435868e+03 ; 7.631649e+02 ; 6.028001e+03 ];
omc_error_63 = [ 7.377994e-03 ; 1.415566e-03 ; 1.258210e-02 ];
Tc_error_63  = [ 3.709523e+01 ; 3.248380e+01 ; 3.395351e+01 ];

%-- Image #64:
omc_64 = [ -3.059462e+00 ; -1.534441e-01 ; -4.328202e-01 ];
Tc_64  = [ -1.600565e+03 ; 7.000714e+02 ; 6.111089e+03 ];
omc_error_64 = [ 8.068207e-03 ; 1.172980e-03 ; 1.398272e-02 ];
Tc_error_64  = [ 3.795649e+01 ; 3.297141e+01 ; 3.420516e+01 ];

%-- Image #65:
omc_65 = [ -2.711561e+00 ; -1.305698e+00 ; 8.725148e-02 ];
Tc_65  = [ -1.147911e+03 ; 1.227762e+02 ; 6.336845e+03 ];
omc_error_65 = [ 6.080638e-03 ; 2.708997e-03 ; 1.116766e-02 ];
Tc_error_65  = [ 3.882182e+01 ; 3.381935e+01 ; 3.345625e+01 ];

%-- Image #66:
omc_66 = [ -2.411180e+00 ; -1.768620e+00 ; 1.094087e-01 ];
Tc_66  = [ -8.064771e+02 ; 2.784519e+01 ; 6.297329e+03 ];
omc_error_66 = [ 5.482478e-03 ; 4.130200e-03 ; 1.041866e-02 ];
Tc_error_66  = [ 3.853280e+01 ; 3.350416e+01 ; 3.309412e+01 ];

%-- Image #67:
omc_67 = [ -2.197082e+00 ; -2.033789e+00 ; 1.992515e-01 ];
Tc_67  = [ -5.847450e+02 ; 3.056634e+01 ; 6.319167e+03 ];
omc_error_67 = [ 5.093348e-03 ; 4.810125e-03 ; 9.980731e-03 ];
Tc_error_67  = [ 3.863158e+01 ; 3.358273e+01 ; 3.312019e+01 ];

%-- Image #68:
omc_68 = [ 1.996792e+00 ; 2.415563e+00 ; -2.527587e-01 ];
Tc_68  = [ -4.445596e+02 ; -1.467762e+02 ; 6.332801e+03 ];
omc_error_68 = [ 5.221586e-03 ; 6.382580e-03 ; 1.209892e-02 ];
Tc_error_68  = [ 3.871138e+01 ; 3.362178e+01 ; 3.338982e+01 ];

%-- Image #69:
omc_69 = [ 1.563149e+00 ; 1.573309e+00 ; -9.194119e-01 ];
Tc_69  = [ -6.447061e+02 ; 5.027760e+02 ; 7.209530e+03 ];
omc_error_69 = [ 3.937912e-03 ; 5.447485e-03 ; 6.780828e-03 ];
Tc_error_69  = [ 4.421792e+01 ; 3.837113e+01 ; 3.649046e+01 ];

%-- Image #70:
omc_70 = [ 1.726168e+00 ; 1.787915e+00 ; -4.664171e-01 ];
Tc_70  = [ -6.473142e+02 ; 1.456670e+02 ; 6.953053e+03 ];
omc_error_70 = [ 3.786676e-03 ; 5.045778e-03 ; 7.624443e-03 ];
Tc_error_70  = [ 4.258341e+01 ; 3.698915e+01 ; 3.625873e+01 ];

%-- Image #71:
omc_71 = [ 1.870353e+00 ; 1.289803e+00 ; -7.131099e-01 ];
Tc_71  = [ -7.265393e+02 ; -2.450347e+02 ; 7.085559e+03 ];
omc_error_71 = [ 4.485720e-03 ; 5.071044e-03 ; 7.010866e-03 ];
Tc_error_71  = [ 4.341483e+01 ; 3.769020e+01 ; 3.699727e+01 ];

%-- Image #72:
omc_72 = [ 1.880302e+00 ; 1.421100e+00 ; -2.772754e-01 ];
Tc_72  = [ -9.017763e+02 ; -7.086432e+02 ; 7.931598e+03 ];
omc_error_72 = [ 4.479502e-03 ; 4.933061e-03 ; 7.371521e-03 ];
Tc_error_72  = [ 4.866152e+01 ; 4.228451e+01 ; 4.289160e+01 ];

%-- Image #73:
omc_73 = [ 1.857584e+00 ; 1.625252e+00 ; -5.115632e-01 ];
Tc_73  = [ -1.495195e+03 ; -8.389777e+02 ; 9.155692e+03 ];
omc_error_73 = [ 3.942088e-03 ; 5.446526e-03 ; 7.906128e-03 ];
Tc_error_73  = [ 5.622368e+01 ; 4.899118e+01 ; 4.923462e+01 ];

%-- Image #74:
omc_74 = [ 1.942436e+00 ; 1.598145e+00 ; -4.202456e-01 ];
Tc_74  = [ -2.524289e+03 ; -8.385175e+02 ; 9.812190e+03 ];
omc_error_74 = [ 3.833621e-03 ; 5.514776e-03 ; 8.350775e-03 ];
Tc_error_74  = [ 6.030440e+01 ; 5.300749e+01 ; 5.555903e+01 ];

%-- Image #75:
omc_75 = [ 1.957899e+00 ; 1.816209e+00 ; -5.995321e-01 ];
Tc_75  = [ -7.833252e+02 ; -7.938588e+02 ; 9.826202e+03 ];
omc_error_75 = [ 3.915279e-03 ; 5.499341e-03 ; 8.665516e-03 ];
Tc_error_75  = [ 6.030093e+01 ; 5.232152e+01 ; 5.181162e+01 ];

%-- Image #76:
omc_76 = [ 2.131176e+00 ; 1.809382e+00 ; -7.764435e-01 ];
Tc_76  = [ 1.454613e+02 ; -8.218231e+02 ; 9.674617e+03 ];
omc_error_76 = [ 4.197177e-03 ; 5.386259e-03 ; 9.094420e-03 ];
Tc_error_76  = [ 5.942315e+01 ; 5.146402e+01 ; 5.104027e+01 ];

%-- Image #77:
omc_77 = [ 2.097988e+00 ; 2.085979e+00 ; -8.784718e-01 ];
Tc_77  = [ 4.210014e+02 ; -7.797662e+02 ; 9.479056e+03 ];
omc_error_77 = [ 3.794550e-03 ; 5.711708e-03 ; 9.600871e-03 ];
Tc_error_77  = [ 5.824123e+01 ; 5.042652e+01 ; 5.005484e+01 ];

%-- Image #78:
omc_78 = [ 1.884898e+00 ; 2.207632e+00 ; -3.502151e-01 ];
Tc_78  = [ 5.270150e+02 ; -6.682787e+02 ; 9.437158e+03 ];
omc_error_78 = [ 4.387829e-03 ; 5.842419e-03 ; 1.092905e-02 ];
Tc_error_78  = [ 5.797191e+01 ; 5.024182e+01 ; 5.092104e+01 ];

% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2228.066375025115576 ; 2228.786210217801909 ];

%-- Principal point:
cc = [ 595.006616093656930 ; 402.729130325574033 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.115486825262222 ; -0.436790036372463 ; -0.001048799785906 ; -0.003791781858206 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 10.326098169362764 ; 10.282891621314697 ];

%-- Principal point uncertainty:
cc_error = [ 12.462582806626889 ; 11.292196493414073 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.016138128695131 ; 0.202153486400662 ; 0.001192264805933 ; 0.001116016169341 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 56;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.906032e+00 ; 1.773529e+00 ; -5.312768e-01 ];
Tc_1  = [ -2.286595e+03 ; 4.252351e+02 ; 1.121552e+04 ];
omc_error_1 = [ 3.446800e-03 ; 5.093295e-03 ; 7.754923e-03 ];
Tc_error_1  = [ 6.271062e+01 ; 5.735442e+01 ; 5.477840e+01 ];

%-- Image #2:
omc_2 = [ 1.840434e+00 ; 1.656912e+00 ; -4.662045e-01 ];
Tc_2  = [ -2.183384e+03 ; 4.252816e+02 ; 9.706962e+03 ];
omc_error_2 = [ 3.468388e-03 ; 4.850438e-03 ; 7.158668e-03 ];
Tc_error_2  = [ 5.428567e+01 ; 4.975781e+01 ; 4.776438e+01 ];

%-- Image #3:
omc_3 = [ 1.888412e+00 ; 1.743268e+00 ; -4.981986e-01 ];
Tc_3  = [ -1.715644e+03 ; 4.214639e+02 ; 9.219107e+03 ];
omc_error_3 = [ 3.449351e-03 ; 4.791978e-03 ; 7.415585e-03 ];
Tc_error_3  = [ 5.160237e+01 ; 4.707594e+01 ; 4.409589e+01 ];

%-- Image #4:
omc_4 = [ 1.818406e+00 ; 1.746684e+00 ; -6.582425e-01 ];
Tc_4  = [ -1.004417e+03 ; 4.244252e+02 ; 9.154726e+03 ];
omc_error_4 = [ 3.448352e-03 ; 4.772324e-03 ; 7.242133e-03 ];
Tc_error_4  = [ 5.123842e+01 ; 4.651704e+01 ; 4.233497e+01 ];

%-- Image #5:
omc_5 = [ 1.952225e+00 ; 1.856220e+00 ; -5.819945e-01 ];
Tc_5  = [ -2.291634e+02 ; 3.771525e+02 ; 8.950605e+03 ];
omc_error_5 = [ 3.645465e-03 ; 4.569206e-03 ; 7.771601e-03 ];
Tc_error_5  = [ 5.008193e+01 ; 4.538169e+01 ; 4.113340e+01 ];

%-- Image #6:
omc_6 = [ 2.221103e+00 ; 2.138392e+00 ; -5.140870e-01 ];
Tc_6  = [ -2.082865e+02 ; 3.346345e+02 ; 8.468426e+03 ];
omc_error_6 = [ 4.259889e-03 ; 4.864684e-03 ; 9.726707e-03 ];
Tc_error_6  = [ 4.735642e+01 ; 4.292895e+01 ; 3.886763e+01 ];

%-- Image #7:
omc_7 = [ -1.981238e+00 ; -1.920264e+00 ; -3.109099e-01 ];
Tc_7  = [ -6.920134e+02 ; 3.690868e+02 ; 8.056040e+03 ];
omc_error_7 = [ 3.480463e-03 ; 4.604504e-03 ; 8.250615e-03 ];
Tc_error_7  = [ 4.508383e+01 ; 4.093405e+01 ; 3.842184e+01 ];

%-- Image #8:
omc_8 = [ -1.788055e+00 ; -1.793807e+00 ; -5.355636e-01 ];
Tc_8  = [ -7.226494e+02 ; 4.275771e+02 ; 7.965915e+03 ];
omc_error_8 = [ 3.460199e-03 ; 4.825764e-03 ; 7.288247e-03 ];
Tc_error_8  = [ 4.458949e+01 ; 4.050377e+01 ; 3.835445e+01 ];

%-- Image #9:
omc_9 = [ 1.906323e+00 ; 1.805855e+00 ; -5.826968e-01 ];
Tc_9  = [ -5.981778e+02 ; 3.647754e+02 ; 8.687844e+03 ];
omc_error_9 = [ 3.547063e-03 ; 4.602233e-03 ; 7.529013e-03 ];
Tc_error_9  = [ 4.860476e+01 ; 4.407669e+01 ; 4.003291e+01 ];

%-- Image #10:
omc_10 = [ 1.676761e+00 ; 1.580236e+00 ; -8.634877e-01 ];
Tc_10  = [ -5.900510e+02 ; 4.390584e+02 ; 8.841932e+03 ];
omc_error_10 = [ 3.747137e-03 ; 4.887936e-03 ; 6.601936e-03 ];
Tc_error_10  = [ 4.948080e+01 ; 4.485316e+01 ; 4.021699e+01 ];

%-- Image #11:
omc_11 = [ 2.030331e+00 ; 1.949140e+00 ; -4.522394e-03 ];
Tc_11  = [ -4.002682e+02 ; 2.838195e+02 ; 9.861707e+03 ];
omc_error_11 = [ 4.697882e-03 ; 4.511886e-03 ; 9.476419e-03 ];
Tc_error_11  = [ 5.518548e+01 ; 5.000245e+01 ; 4.742183e+01 ];

%-- Image #12:
omc_12 = [ -2.206037e+00 ; -2.222958e+00 ; 6.587452e-02 ];
Tc_12  = [ -9.282714e+02 ; 3.037969e+02 ; 1.191743e+04 ];
omc_error_12 = [ 1.135324e-02 ; 1.211722e-02 ; 2.605512e-02 ];
Tc_error_12  = [ 6.669140e+01 ; 6.046408e+01 ; 5.639202e+01 ];

%-- Image #13:
omc_13 = [ -2.237406e+00 ; -2.146595e+00 ; 7.831295e-03 ];
Tc_13  = [ -2.272773e+03 ; 4.505828e+02 ; 1.315103e+04 ];
omc_error_13 = [ 7.465264e-03 ; 7.288098e-03 ; 1.668718e-02 ];
Tc_error_13  = [ 7.395865e+01 ; 6.705607e+01 ; 6.330672e+01 ];

%-- Image #14:
omc_14 = [ 2.172225e+00 ; 2.164759e+00 ; -2.630765e-01 ];
Tc_14  = [ 8.067865e+02 ; 3.127747e+02 ; 1.320561e+04 ];
omc_error_14 = [ 1.006363e-02 ; 9.069300e-03 ; 2.064763e-02 ];
Tc_error_14  = [ 7.393844e+01 ; 6.701704e+01 ; 6.315701e+01 ];

%-- Image #15:
omc_15 = [ -2.192082e+00 ; -2.170426e+00 ; 2.616785e-01 ];
Tc_15  = [ 1.602257e+03 ; 3.145498e+02 ; 1.312351e+04 ];
omc_error_15 = [ 1.710645e-02 ; 2.125054e-02 ; 4.579856e-02 ];
Tc_error_15  = [ 7.365964e+01 ; 6.678862e+01 ; 6.501197e+01 ];

%-- Image #16:
omc_16 = [ -2.147169e+00 ; -2.068215e+00 ; 2.849573e-01 ];
Tc_16  = [ -7.625833e+02 ; 2.755938e+02 ; 7.355135e+03 ];
omc_error_16 = [ 4.600272e-03 ; 4.343917e-03 ; 9.080901e-03 ];
Tc_error_16  = [ 4.116721e+01 ; 3.734712e+01 ; 3.427447e+01 ];

%-- Image #17:
omc_17 = [ -1.968486e+00 ; -1.950810e+00 ; -1.809109e-01 ];
Tc_17  = [ -7.440829e+02 ; 2.322795e+02 ; 7.031091e+03 ];
omc_error_17 = [ 3.529869e-03 ; 4.465459e-03 ; 8.206402e-03 ];
Tc_error_17  = [ 3.934291e+01 ; 3.572852e+01 ; 3.340590e+01 ];

%-- Image #18:
omc_18 = [ -1.660115e+00 ; -1.707287e+00 ; -5.641653e-01 ];
Tc_18  = [ -7.093836e+02 ; 3.545730e+02 ; 6.755934e+03 ];
omc_error_18 = [ 3.579270e-03 ; 4.892181e-03 ; 6.709260e-03 ];
Tc_error_18  = [ 3.781552e+01 ; 3.436958e+01 ; 3.268280e+01 ];

%-- Image #19:
omc_19 = [ 1.573956e+00 ; 1.590575e+00 ; -7.776212e-01 ];
Tc_19  = [ -1.033844e+03 ; 3.140114e+02 ; 7.403619e+03 ];
omc_error_19 = [ 3.592487e-03 ; 4.924899e-03 ; 6.377660e-03 ];
Tc_error_19  = [ 4.144077e+01 ; 3.765877e+01 ; 3.398152e+01 ];

%-- Image #20:
omc_20 = [ 1.560770e+00 ; 1.624517e+00 ; -8.505459e-01 ];
Tc_20  = [ -1.742809e+03 ; 3.687474e+02 ; 7.709340e+03 ];
omc_error_20 = [ 3.283468e-03 ; 5.157827e-03 ; 6.492639e-03 ];
Tc_error_20  = [ 4.310115e+01 ; 3.951685e+01 ; 3.710747e+01 ];

%-- Image #21:
omc_21 = [ 2.255445e+00 ; 2.131170e+00 ; -1.486584e-01 ];
Tc_21  = [ -1.534166e+03 ; 2.494187e+02 ; 7.232109e+03 ];
omc_error_21 = [ 5.548655e-03 ; 5.776990e-03 ; 1.156266e-02 ];
Tc_error_21  = [ 4.067650e+01 ; 3.699760e+01 ; 3.499305e+01 ];

%-- Image #22:
omc_22 = [ -2.208054e+00 ; -2.164062e+00 ; 2.967431e-02 ];
Tc_22  = [ -8.413525e+02 ; -3.178404e+02 ; 6.987635e+03 ];
omc_error_22 = [ 5.904045e-03 ; 5.740238e-03 ; 1.334744e-02 ];
Tc_error_22  = [ 3.908564e+01 ; 3.546006e+01 ; 3.309233e+01 ];

%-- Image #23:
omc_23 = [ 2.205175e+00 ; 2.176080e+00 ; -3.682309e-02 ];
Tc_23  = [ -2.271918e+02 ; -3.472979e+02 ; 6.740657e+03 ];
omc_error_23 = [ 6.167983e-03 ; 5.951953e-03 ; 1.372902e-02 ];
Tc_error_23  = [ 3.772126e+01 ; 3.411520e+01 ; 3.197350e+01 ];

%-- Image #24:
omc_24 = [ 1.557856e+00 ; 1.605117e+00 ; -1.030398e+00 ];
Tc_24  = [ -8.565799e+02 ; -4.858775e+01 ; 7.149554e+03 ];
omc_error_24 = [ 3.731100e-03 ; 5.241623e-03 ; 6.428873e-03 ];
Tc_error_24  = [ 3.998460e+01 ; 3.628357e+01 ; 3.219920e+01 ];

%-- Image #25:
omc_25 = [ -1.736173e+00 ; -1.573945e+00 ; -8.284896e-01 ];
Tc_25  = [ -9.733891e+02 ; 4.430940e+02 ; 6.220415e+03 ];
omc_error_25 = [ 3.912948e-03 ; 4.864365e-03 ; 6.693419e-03 ];
Tc_error_25  = [ 3.484146e+01 ; 3.174797e+01 ; 3.083194e+01 ];

%-- Image #26:
omc_26 = [ -1.213959e+00 ; -2.762187e+00 ; 2.098969e-01 ];
Tc_26  = [ -3.387655e+02 ; -5.121151e+02 ; 6.764971e+03 ];
omc_error_26 = [ 3.055322e-03 ; 6.214317e-03 ; 8.790819e-03 ];
Tc_error_26  = [ 3.781989e+01 ; 3.425034e+01 ; 3.204481e+01 ];

%-- Image #27:
omc_27 = [ -1.016276e+00 ; -2.912575e+00 ; 4.175489e-01 ];
Tc_27  = [ 3.068960e+02 ; -4.706804e+02 ; 6.877087e+03 ];
omc_error_27 = [ 2.851188e-03 ; 5.643547e-03 ; 8.967795e-03 ];
Tc_error_27  = [ 3.844833e+01 ; 3.482164e+01 ; 3.219087e+01 ];

%-- Image #28:
omc_28 = [ 8.654028e-01 ; 2.198436e+00 ; -7.415035e-01 ];
Tc_28  = [ -1.336231e+03 ; -2.729563e+00 ; 7.639301e+03 ];
omc_error_28 = [ 2.453461e-03 ; 5.560880e-03 ; 6.457542e-03 ];
Tc_error_28  = [ 4.276408e+01 ; 3.894278e+01 ; 3.506898e+01 ];

%-- Image #29:
omc_29 = [ 9.470240e-01 ; 2.216291e+00 ; -4.660363e-01 ];
Tc_29  = [ -9.228381e+02 ; -1.387660e+00 ; 7.782581e+03 ];
omc_error_29 = [ 2.496529e-03 ; 5.338428e-03 ; 6.648181e-03 ];
Tc_error_29  = [ 4.358123e+01 ; 3.954774e+01 ; 3.557079e+01 ];

%-- Image #30:
omc_30 = [ 9.482388e-01 ; 2.243799e+00 ; -6.600168e-01 ];
Tc_30  = [ -4.959063e+02 ; 2.936185e+01 ; 8.217651e+03 ];
omc_error_30 = [ 2.588706e-03 ; 5.460083e-03 ; 6.703341e-03 ];
Tc_error_30  = [ 4.594040e+01 ; 4.167147e+01 ; 3.711722e+01 ];

%-- Image #31:
omc_31 = [ 9.864977e-01 ; 2.011569e+00 ; -4.263591e-01 ];
Tc_31  = [ -1.338385e+02 ; 2.799588e+01 ; 8.260077e+03 ];
omc_error_31 = [ 3.209666e-03 ; 5.248245e-03 ; 6.101314e-03 ];
Tc_error_31  = [ 4.615947e+01 ; 4.186947e+01 ; 3.799878e+01 ];

%-- Image #32:
omc_32 = [ 1.001238e+00 ; 2.028381e+00 ; -6.058761e-01 ];
Tc_32  = [ 3.689916e+02 ; -5.868920e+00 ; 8.090240e+03 ];
omc_error_32 = [ 3.325315e-03 ; 5.298529e-03 ; 6.077847e-03 ];
Tc_error_32  = [ 4.522551e+01 ; 4.102648e+01 ; 3.704529e+01 ];

%-- Image #33:
omc_33 = [ 9.757179e-01 ; 2.397413e+00 ; -1.084190e+00 ];
Tc_33  = [ 1.841681e+02 ; 7.686575e+01 ; 9.343973e+03 ];
omc_error_33 = [ 2.668180e-03 ; 5.780759e-03 ; 7.138685e-03 ];
Tc_error_33  = [ 5.223984e+01 ; 4.736877e+01 ; 4.194210e+01 ];

%-- Image #34:
omc_34 = [ 8.472415e-01 ; 2.548671e+00 ; -1.123743e+00 ];
Tc_34  = [ 2.156518e+02 ; 1.471342e+02 ; 1.036502e+04 ];
omc_error_34 = [ 2.535622e-03 ; 5.914151e-03 ; 7.439559e-03 ];
Tc_error_34  = [ 5.795434e+01 ; 5.255512e+01 ; 4.692816e+01 ];

%-- Image #35:
omc_35 = [ 9.841181e-01 ; 2.050165e+00 ; -5.521221e-01 ];
Tc_35  = [ -1.693407e+03 ; 1.339492e+02 ; 9.814102e+03 ];
omc_error_35 = [ 2.765686e-03 ; 5.429064e-03 ; 6.387073e-03 ];
Tc_error_35  = [ 5.504688e+01 ; 5.003460e+01 ; 4.555047e+01 ];

%-- Image #36:
omc_36 = [ 9.152826e-01 ; 2.720980e+00 ; -9.552652e-01 ];
Tc_36  = [ 5.359460e+02 ; -6.533259e+01 ; 8.634292e+03 ];
omc_error_36 = [ 1.981058e-03 ; 5.826042e-03 ; 7.842816e-03 ];
Tc_error_36  = [ 4.827755e+01 ; 4.381434e+01 ; 3.920781e+01 ];

%-- Image #37:
omc_37 = [ 2.236489e+00 ; 2.102022e+00 ; 4.694434e-02 ];
Tc_37  = [ -5.230763e+02 ; -1.016988e+03 ; 1.046720e+04 ];
omc_error_37 = [ 7.468725e-03 ; 7.773259e-03 ; 1.777281e-02 ];
Tc_error_37  = [ 5.866629e+01 ; 5.309379e+01 ; 5.011922e+01 ];

%-- Image #38:
omc_38 = [ 1.881026e+00 ; 2.032786e+00 ; -3.044167e-01 ];
Tc_38  = [ -3.610452e+02 ; -1.413212e+03 ; 1.050904e+04 ];
omc_error_38 = [ 3.678812e-03 ; 5.105524e-03 ; 8.515762e-03 ];
Tc_error_38  = [ 5.903409e+01 ; 5.332558e+01 ; 4.993804e+01 ];

%-- Image #39:
omc_39 = [ 1.701348e+00 ; 1.911046e+00 ; -5.583404e-01 ];
Tc_39  = [ -1.104778e+03 ; -1.439244e+03 ; 1.072330e+04 ];
omc_error_39 = [ 3.350364e-03 ; 5.291557e-03 ; 7.671331e-03 ];
Tc_error_39  = [ 6.025642e+01 ; 5.451851e+01 ; 5.099960e+01 ];

%-- Image #40:
omc_40 = [ 1.843586e+00 ; 2.011170e+00 ; -4.087082e-01 ];
Tc_40  = [ -1.947152e+03 ; -1.466614e+03 ; 1.042870e+04 ];
omc_error_40 = [ 3.063701e-03 ; 5.470066e-03 ; 8.845618e-03 ];
Tc_error_40  = [ 5.865186e+01 ; 5.324841e+01 ; 5.209052e+01 ];

%-- Image #41:
omc_41 = [ 1.863664e+00 ; 2.392196e+00 ; -2.811598e-01 ];
Tc_41  = [ 4.858475e+01 ; -1.463920e+03 ; 9.926780e+03 ];
omc_error_41 = [ 3.882517e-03 ; 6.029665e-03 ; 1.020879e-02 ];
Tc_error_41  = [ 5.583278e+01 ; 5.034298e+01 ; 4.732282e+01 ];

%-- Image #42:
omc_42 = [ 9.059436e-01 ; 2.599273e+00 ; -4.745502e-01 ];
Tc_42  = [ -4.536612e+02 ; -1.574984e+03 ; 1.065999e+04 ];
omc_error_42 = [ 2.015465e-03 ; 6.078271e-03 ; 8.243720e-03 ];
Tc_error_42  = [ 5.993372e+01 ; 5.414293e+01 ; 5.018440e+01 ];

%-- Image #43:
omc_43 = [ 7.583606e-01 ; 2.756456e+00 ; -1.483403e-01 ];
Tc_43  = [ -1.400916e+03 ; -1.524005e+03 ; 1.024847e+04 ];
omc_error_43 = [ 1.636241e-03 ; 7.966856e-03 ; 1.020424e-02 ];
Tc_error_43  = [ 5.765152e+01 ; 5.209384e+01 ; 5.027349e+01 ];

%-- Image #44:
omc_44 = [ 6.590895e-01 ; 2.090848e+00 ; -9.007221e-01 ];
Tc_44  = [ -1.395876e+03 ; -1.315818e+03 ; 1.067757e+04 ];
omc_error_44 = [ 3.432125e-03 ; 5.836396e-03 ; 6.272189e-03 ];
Tc_error_44  = [ 5.990833e+01 ; 5.435284e+01 ; 5.009659e+01 ];

%-- Image #45:
omc_45 = [ 5.880296e-01 ; 2.391950e+00 ; -1.151986e+00 ];
Tc_45  = [ -3.237014e+02 ; -1.315670e+03 ; 1.083415e+04 ];
omc_error_45 = [ 3.451636e-03 ; 5.948091e-03 ; 6.954171e-03 ];
Tc_error_45  = [ 6.082782e+01 ; 5.503187e+01 ; 4.954224e+01 ];

%-- Image #46:
omc_46 = [ -1.056880e+00 ; -2.822126e+00 ; -7.224138e-01 ];
Tc_46  = [ -1.486891e+03 ; -1.266406e+03 ; 9.193029e+03 ];
omc_error_46 = [ 2.441092e-03 ; 5.735770e-03 ; 1.036821e-02 ];
Tc_error_46  = [ 5.160060e+01 ; 4.673898e+01 ; 4.821180e+01 ];

%-- Image #47:
omc_47 = [ -5.210707e-01 ; -3.040277e+00 ; 1.620664e-01 ];
Tc_47  = [ -4.486421e+02 ; -1.234150e+03 ; 8.156583e+03 ];
omc_error_47 = [ 2.147838e-03 ; 7.398954e-03 ; 1.099887e-02 ];
Tc_error_47  = [ 4.590755e+01 ; 4.131604e+01 ; 3.932619e+01 ];

%-- Image #48:
omc_48 = [ 1.091067e+00 ; 2.929910e+00 ; -4.034967e-01 ];
Tc_48  = [ 6.948722e+02 ; -4.639733e+02 ; 6.860420e+03 ];
omc_error_48 = [ 2.199744e-03 ; 5.975883e-03 ; 9.858735e-03 ];
Tc_error_48  = [ 3.839803e+01 ; 3.481993e+01 ; 3.248086e+01 ];

%-- Image #49:
omc_49 = [ 9.152826e-01 ; 2.720980e+00 ; -9.552650e-01 ];
Tc_49  = [ 5.359460e+02 ; -6.533259e+01 ; 8.634293e+03 ];
omc_error_49 = [ 1.981058e-03 ; 5.826042e-03 ; 7.842816e-03 ];
Tc_error_49  = [ 4.827755e+01 ; 4.381434e+01 ; 3.920782e+01 ];

%-- Image #50:
omc_50 = [ 9.887820e-01 ; 2.797723e+00 ; -7.961464e-01 ];
Tc_50  = [ 3.676623e+02 ; -8.482745e+01 ; 8.298252e+03 ];
omc_error_50 = [ 1.677661e-03 ; 5.817119e-03 ; 8.185187e-03 ];
Tc_error_50  = [ 4.637719e+01 ; 4.208833e+01 ; 3.790135e+01 ];

%-- Image #51:
omc_51 = [ 1.164895e+00 ; 2.871516e+00 ; -2.875403e-01 ];
Tc_51  = [ 6.899029e+01 ; -8.654406e+01 ; 7.927638e+03 ];
omc_error_51 = [ 3.571799e-03 ; 7.964211e-03 ; 1.235541e-02 ];
Tc_error_51  = [ 4.427474e+01 ; 4.016948e+01 ; 3.721896e+01 ];

%-- Image #52:
omc_52 = [ 1.040216e+00 ; 2.875274e+00 ; -1.771889e-01 ];
Tc_52  = [ 1.393798e+02 ; -7.654885e+01 ; 7.833418e+03 ];
omc_error_52 = [ 3.664108e-03 ; 8.834615e-03 ; 1.379021e-02 ];
Tc_error_52  = [ 4.374868e+01 ; 3.970958e+01 ; 3.707329e+01 ];

%-- Image #53:
omc_53 = [ 7.045115e-01 ; 3.005443e+00 ; -1.268051e-01 ];
Tc_53  = [ 5.171915e+02 ; -6.514988e+01 ; 7.765240e+03 ];
omc_error_53 = [ 2.821884e-03 ; 9.489270e-03 ; 1.397165e-02 ];
Tc_error_53  = [ 4.340105e+01 ; 3.942376e+01 ; 3.685879e+01 ];

%-- Image #54:
omc_54 = [ 1.753794e-01 ; 3.137728e+00 ; -1.093455e-01 ];
Tc_54  = [ 1.047372e+03 ; 1.185349e+02 ; 7.708031e+03 ];
omc_error_54 = [ 1.577157e-03 ; 1.067661e-02 ; 1.462335e-02 ];
Tc_error_54  = [ 4.322286e+01 ; 3.929956e+01 ; 3.666050e+01 ];

%-- Image #55:
omc_55 = [ -4.343694e-02 ; -3.102487e+00 ; 6.517031e-02 ];
Tc_55  = [ 1.159495e+03 ; 1.893361e+02 ; 7.627914e+03 ];
omc_error_55 = [ 1.149055e-03 ; 1.178327e-02 ; 1.470224e-02 ];
Tc_error_55  = [ 4.280661e+01 ; 3.894741e+01 ; 3.653623e+01 ];

%-- Image #56:
omc_56 = [ -4.338945e-02 ; -3.101889e+00 ; 5.998173e-02 ];
Tc_56  = [ 1.159258e+03 ; 1.888555e+02 ; 7.620655e+03 ];
omc_error_56 = [ 1.139848e-03 ; 1.170339e-02 ; 1.459390e-02 ];
Tc_error_56  = [ 4.276318e+01 ; 3.891128e+01 ; 3.652040e+01 ];


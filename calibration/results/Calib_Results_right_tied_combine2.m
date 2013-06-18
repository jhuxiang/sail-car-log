% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2271.283620819179760 ; 2273.585537565375489 ];

%-- Principal point:
cc = [ 622.033783690240057 ; 419.488544805874596 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.176348910713040 ; 0.154100705947583 ; -0.003754681244698 ; -0.001316770859980 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.610021315665525 ; 3.544985988415849 ];

%-- Principal point uncertainty:
cc_error = [ 5.356452594900783 ; 6.445773041717345 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.008317216168280 ; 0.086563534397951 ; 0.000502091106640 ; 0.000473778744771 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 79;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.910215e+00 ; 1.772233e+00 ; -5.236895e-01 ];
Tc_1  = [ -2.417862e+03 ; 3.409297e+02 ; 1.136593e+04 ];
omc_error_1 = [ 2.743244e-03 ; 3.572557e-03 ; 5.441273e-03 ];
Tc_error_1  = [ 2.696021e+01 ; 3.268970e+01 ; 2.207029e+01 ];

%-- Image #2:
omc_2 = [ 1.846310e+00 ; 1.656095e+00 ; -4.581040e-01 ];
Tc_2  = [ -2.298381e+03 ; 3.525352e+02 ; 9.841470e+03 ];
omc_error_2 = [ 2.428945e-03 ; 3.113899e-03 ; 4.605821e-03 ];
Tc_error_2  = [ 2.337499e+01 ; 2.839324e+01 ; 1.879872e+01 ];

%-- Image #3:
omc_3 = [ 1.894013e+00 ; 1.742741e+00 ; -4.890444e-01 ];
Tc_3  = [ -1.825171e+03 ; 3.520744e+02 ; 9.351849e+03 ];
omc_error_3 = [ 2.494783e-03 ; 3.151525e-03 ; 4.808134e-03 ];
Tc_error_3  = [ 2.213744e+01 ; 2.684511e+01 ; 1.717058e+01 ];

%-- Image #4:
omc_4 = [ 1.825129e+00 ; 1.746277e+00 ; -6.431430e-01 ];
Tc_4  = [ -1.114838e+03 ; 3.551478e+02 ; 9.305270e+03 ];
omc_error_4 = [ 2.411254e-03 ; 3.009814e-03 ; 4.320486e-03 ];
Tc_error_4  = [ 2.197233e+01 ; 2.651431e+01 ; 1.636891e+01 ];

%-- Image #5:
omc_5 = [ 1.957344e+00 ; 1.855118e+00 ; -5.595028e-01 ];
Tc_5  = [ -3.380102e+02 ; 3.089848e+02 ; 9.108911e+03 ];
omc_error_5 = [ 2.836040e-03 ; 3.140536e-03 ; 5.145358e-03 ];
Tc_error_5  = [ 2.149476e+01 ; 2.584507e+01 ; 1.577345e+01 ];

%-- Image #6:
omc_6 = [ 2.224807e+00 ; 2.141369e+00 ; -4.908113e-01 ];
Tc_6  = [ -3.110673e+02 ; 2.700241e+02 ; 8.614466e+03 ];
omc_error_6 = [ 4.518496e-03 ; 4.228250e-03 ; 8.899142e-03 ];
Tc_error_6  = [ 2.032504e+01 ; 2.443584e+01 ; 1.450159e+01 ];

%-- Image #7:
omc_7 = [ -1.979431e+00 ; -1.925154e+00 ; -3.310202e-01 ];
Tc_7  = [ -7.897625e+02 ; 3.081317e+02 ; 8.198845e+03 ];
omc_error_7 = [ 2.650753e-03 ; 3.087203e-03 ; 5.327859e-03 ];
Tc_error_7  = [ 1.935696e+01 ; 2.332696e+01 ; 1.484357e+01 ];

%-- Image #8:
omc_8 = [ -1.783105e+00 ; -1.798053e+00 ; -5.544038e-01 ];
Tc_8  = [ -8.193583e+02 ; 3.673928e+02 ; 8.107499e+03 ];
omc_error_8 = [ 2.354475e-03 ; 2.834427e-03 ; 4.103846e-03 ];
Tc_error_8  = [ 1.914636e+01 ; 2.308218e+01 ; 1.472810e+01 ];

%-- Image #9:
omc_9 = [ 1.912300e+00 ; 1.805258e+00 ; -5.638648e-01 ];
Tc_9  = [ -7.034978e+02 ; 2.988915e+02 ; 8.838700e+03 ];
omc_error_9 = [ 2.596597e-03 ; 3.019617e-03 ; 4.700855e-03 ];
Tc_error_9  = [ 2.085767e+01 ; 2.511535e+01 ; 1.529713e+01 ];

%-- Image #10:
omc_10 = [ 1.685216e+00 ; 1.578895e+00 ; -8.466298e-01 ];
Tc_10  = [ -6.972539e+02 ; 3.719110e+02 ; 8.994864e+03 ];
omc_error_10 = [ 2.340060e-03 ; 2.849975e-03 ; 3.516965e-03 ];
Tc_error_10  = [ 2.123086e+01 ; 2.556146e+01 ; 1.547069e+01 ];

%-- Image #11:
omc_11 = [ 2.030841e+00 ; 1.945516e+00 ; 1.851995e-02 ];
Tc_11  = [ -5.198431e+02 ; 2.091886e+02 ; 1.003890e+04 ];
omc_error_11 = [ 4.260710e-03 ; 4.309403e-03 ; 8.424333e-03 ];
Tc_error_11  = [ 2.372496e+01 ; 2.848464e+01 ; 2.118703e+01 ];

%-- Image #12:
omc_12 = [ 2.205124e+00 ; 2.222492e+00 ; -5.714854e-02 ];
Tc_12  = [ -1.072972e+03 ; 2.141304e+02 ; 1.213562e+04 ];
omc_error_12 = [ 1.783106e-02 ; 1.756325e-02 ; 3.884810e-02 ];
Tc_error_12  = [ 2.867846e+01 ; 3.450742e+01 ; 2.448532e+01 ];

%-- Image #13:
omc_13 = [ -2.252596e+00 ; -2.162474e+00 ; -1.765192e-02 ];
Tc_13  = [ -2.434309e+03 ; 3.522894e+02 ; 1.337243e+04 ];
omc_error_13 = [ 9.882400e-03 ; 9.289862e-03 ; 2.110711e-02 ];
Tc_error_13  = [ 3.196374e+01 ; 3.833313e+01 ; 2.857678e+01 ];

%-- Image #14:
omc_14 = [ 2.164032e+00 ; 2.155786e+00 ; -2.342832e-01 ];
Tc_14  = [ 6.447189e+02 ; 2.126112e+02 ; 1.344127e+04 ];
omc_error_14 = [ 1.221301e-02 ; 1.118597e-02 ; 2.480534e-02 ];
Tc_error_14  = [ 3.175821e+01 ; 3.814486e+01 ; 2.868525e+01 ];

%-- Image #15:
omc_15 = [ -2.216606e+00 ; -2.199271e+00 ; 2.421906e-01 ];
Tc_15  = [ 1.438926e+03 ; 2.151351e+02 ; 1.335430e+04 ];
omc_error_15 = [ 1.733992e-02 ; 2.034340e-02 ; 4.210770e-02 ];
Tc_error_15  = [ 3.173597e+01 ; 3.801502e+01 ; 3.282883e+01 ];

%-- Image #16:
omc_16 = [ -2.150518e+00 ; -2.074292e+00 ; 2.727617e-01 ];
Tc_16  = [ -8.511276e+02 ; 2.198706e+02 ; 7.477220e+03 ];
omc_error_16 = [ 3.591953e-03 ; 3.659514e-03 ; 7.583090e-03 ];
Tc_error_16  = [ 1.770417e+01 ; 2.128130e+01 ; 1.285768e+01 ];

%-- Image #17:
omc_17 = [ -1.967833e+00 ; -1.956682e+00 ; -2.004559e-01 ];
Tc_17  = [ -8.293887e+02 ; 1.791065e+02 ; 7.153559e+03 ];
omc_error_17 = [ 2.572483e-03 ; 2.919783e-03 ; 5.253634e-03 ];
Tc_error_17  = [ 1.689639e+01 ; 2.036433e+01 ; 1.262397e+01 ];

%-- Image #18:
omc_18 = [ -1.653994e+00 ; -1.711918e+00 ; -5.816401e-01 ];
Tc_18  = [ -7.914182e+02 ; 3.035326e+02 ; 6.874842e+03 ];
omc_error_18 = [ 2.257166e-03 ; 2.657848e-03 ; 3.539625e-03 ];
Tc_error_18  = [ 1.623867e+01 ; 1.958441e+01 ; 1.222059e+01 ];

%-- Image #19:
omc_19 = [ 1.582196e+00 ; 1.589104e+00 ; -7.638771e-01 ];
Tc_19  = [ -1.122999e+03 ; 2.580478e+02 ; 7.520371e+03 ];
omc_error_19 = [ 2.133064e-03 ; 2.728258e-03 ; 3.281165e-03 ];
Tc_error_19  = [ 1.776452e+01 ; 2.147171e+01 ; 1.277311e+01 ];

%-- Image #20:
omc_20 = [ 1.568392e+00 ; 1.624064e+00 ; -8.398106e-01 ];
Tc_20  = [ -1.833278e+03 ; 3.105604e+02 ; 7.811412e+03 ];
omc_error_20 = [ 1.971178e-03 ; 2.880631e-03 ; 3.417150e-03 ];
Tc_error_20  = [ 1.852317e+01 ; 2.253719e+01 ; 1.399410e+01 ];

%-- Image #21:
omc_21 = [ 2.243646e+00 ; 2.118731e+00 ; -1.444162e-01 ];
Tc_21  = [ -1.621441e+03 ; 1.953986e+02 ; 7.342087e+03 ];
omc_error_21 = [ 4.998174e-03 ; 5.160710e-03 ; 1.050634e-02 ];
Tc_error_21  = [ 1.748653e+01 ; 2.113289e+01 ; 1.290116e+01 ];

%-- Image #22:
omc_22 = [ -2.218309e+00 ; -2.174683e+00 ; 7.038125e-03 ];
Tc_22  = [ -9.263118e+02 ; -3.701254e+02 ; 7.110958e+03 ];
omc_error_22 = [ 7.549016e-03 ; 7.183760e-03 ; 1.628194e-02 ];
Tc_error_22  = [ 1.679797e+01 ; 2.023642e+01 ; 1.291939e+01 ];

%-- Image #23:
omc_23 = [ 2.199550e+00 ; 2.169797e+00 ; -3.111364e-02 ];
Tc_23  = [ -3.090400e+02 ; -3.977536e+02 ; 6.871010e+03 ];
omc_error_23 = [ 7.016726e-03 ; 6.961101e-03 ; 1.519685e-02 ];
Tc_error_23  = [ 1.621500e+01 ; 1.947402e+01 ; 1.352591e+01 ];

%-- Image #24:
omc_24 = [ 1.565566e+00 ; 1.603087e+00 ; -1.016212e+00 ];
Tc_24  = [ -9.425478e+02 ; -1.018897e+02 ; 7.264569e+03 ];
omc_error_24 = [ 2.107503e-03 ; 2.910022e-03 ; 3.164015e-03 ];
Tc_error_24  = [ 1.713671e+01 ; 2.068684e+01 ; 1.201702e+01 ];

%-- Image #25:
omc_25 = [ -1.728296e+00 ; -1.575879e+00 ; -8.468359e-01 ];
Tc_25  = [ -1.048834e+03 ; 3.963191e+02 ; 6.323089e+03 ];
omc_error_25 = [ 2.364924e-03 ; 2.680673e-03 ; 3.280229e-03 ];
Tc_error_25  = [ 1.494284e+01 ; 1.809378e+01 ; 1.151709e+01 ];

%-- Image #26:
omc_26 = [ -1.218259e+00 ; -2.772944e+00 ; 2.006898e-01 ];
Tc_26  = [ -4.204648e+02 ; -5.624860e+02 ; 6.888234e+03 ];
omc_error_26 = [ 2.426447e-03 ; 5.516379e-03 ; 8.532966e-03 ];
Tc_error_26  = [ 1.626790e+01 ; 1.955512e+01 ; 1.181594e+01 ];

%-- Image #27:
omc_27 = [ -1.022130e+00 ; -2.924390e+00 ; 4.051127e-01 ];
Tc_27  = [ 2.233438e+02 ; -5.217921e+02 ; 7.002748e+03 ];
omc_error_27 = [ 1.902161e-03 ; 4.877190e-03 ; 7.959055e-03 ];
Tc_error_27  = [ 1.650465e+01 ; 1.985382e+01 ; 1.174191e+01 ];

%-- Image #28:
omc_28 = [ 8.720626e-01 ; 2.198106e+00 ; -7.303751e-01 ];
Tc_28  = [ -1.426795e+03 ; -6.011838e+01 ; 7.750733e+03 ];
omc_error_28 = [ 1.527626e-03 ; 2.939859e-03 ; 3.811618e-03 ];
Tc_error_28  = [ 1.840805e+01 ; 2.220634e+01 ; 1.324117e+01 ];

%-- Image #29:
omc_29 = [ 9.526431e-01 ; 2.214506e+00 ; -4.513297e-01 ];
Tc_29  = [ -1.016476e+03 ; -6.032419e+01 ; 7.910346e+03 ];
omc_error_29 = [ 1.656655e-03 ; 2.931216e-03 ; 4.024459e-03 ];
Tc_error_29  = [ 1.874023e+01 ; 2.254190e+01 ; 1.317042e+01 ];

%-- Image #30:
omc_30 = [ 9.540069e-01 ; 2.240278e+00 ; -6.437587e-01 ];
Tc_30  = [ -5.949229e+02 ; -3.306787e+01 ; 8.357913e+03 ];
omc_error_30 = [ 1.737268e-03 ; 3.010056e-03 ; 3.982506e-03 ];
Tc_error_30  = [ 1.973033e+01 ; 2.373771e+01 ; 1.387582e+01 ];

%-- Image #31:
omc_31 = [ 9.916626e-01 ; 2.004118e+00 ; -4.100776e-01 ];
Tc_31  = [ -2.339177e+02 ; -3.486087e+01 ; 8.402619e+03 ];
omc_error_31 = [ 2.033809e-03 ; 2.746061e-03 ; 3.515449e-03 ];
Tc_error_31  = [ 1.981557e+01 ; 2.383117e+01 ; 1.417211e+01 ];

%-- Image #32:
omc_32 = [ 1.007039e+00 ; 2.019827e+00 ; -5.892334e-01 ];
Tc_32  = [ 2.695374e+02 ; -6.731479e+01 ; 8.226188e+03 ];
omc_error_32 = [ 2.093296e-03 ; 2.791043e-03 ; 3.417618e-03 ];
Tc_error_32  = [ 1.939760e+01 ; 2.333490e+01 ; 1.370942e+01 ];

%-- Image #33:
omc_33 = [ 9.821229e-01 ; 2.394000e+00 ; -1.064979e+00 ];
Tc_33  = [ 7.058188e+01 ; 5.899537e+00 ; 9.509977e+03 ];
omc_error_33 = [ 1.880277e-03 ; 3.340269e-03 ; 4.157645e-03 ];
Tc_error_33  = [ 2.242425e+01 ; 2.697546e+01 ; 1.670592e+01 ];

%-- Image #34:
omc_34 = [ 8.533119e-01 ; 2.545632e+00 ; -1.104363e+00 ];
Tc_34  = [ 8.981843e+01 ; 6.839180e+01 ; 1.055130e+04 ];
omc_error_34 = [ 1.935582e-03 ; 3.551272e-03 ; 4.554763e-03 ];
Tc_error_34  = [ 2.488243e+01 ; 2.993357e+01 ; 1.971967e+01 ];

%-- Image #35:
omc_35 = [ 9.908689e-01 ; 2.049130e+00 ; -5.405873e-01 ];
Tc_35  = [ -1.811722e+03 ; 6.028383e+01 ; 9.967598e+03 ];
omc_error_35 = [ 1.854767e-03 ; 3.076838e-03 ; 4.003783e-03 ];
Tc_error_35  = [ 2.371791e+01 ; 2.855972e+01 ; 1.781490e+01 ];

%-- Image #36:
omc_36 = [ 9.191649e-01 ; 2.715363e+00 ; -9.338312e-01 ];
Tc_36  = [ 4.303807e+02 ; -1.307214e+02 ; 8.788799e+03 ];
omc_error_36 = [ 1.735664e-03 ; 3.562401e-03 ; 4.928905e-03 ];
Tc_error_36  = [ 2.072275e+01 ; 2.494468e+01 ; 1.546270e+01 ];

%-- Image #37:
omc_37 = [ 2.231871e+00 ; 2.096089e+00 ; 5.551076e-02 ];
Tc_37  = [ -6.505853e+02 ; -1.095161e+03 ; 1.066916e+04 ];
omc_error_37 = [ 8.626254e-03 ; 9.404776e-03 ; 1.963497e-02 ];
Tc_error_37  = [ 2.524583e+01 ; 3.030860e+01 ; 2.342301e+01 ];

%-- Image #38:
omc_38 = [ 1.881214e+00 ; 2.025982e+00 ; -2.889704e-01 ];
Tc_38  = [ -4.891909e+02 ; -1.490500e+03 ; 1.070364e+04 ];
omc_error_38 = [ 2.812690e-03 ; 3.697562e-03 ; 5.917753e-03 ];
Tc_error_38  = [ 2.535907e+01 ; 3.048942e+01 ; 2.024282e+01 ];

%-- Image #39:
omc_39 = [ 1.703502e+00 ; 1.904755e+00 ; -5.447125e-01 ];
Tc_39  = [ -1.234895e+03 ; -1.516773e+03 ; 1.090437e+04 ];
omc_error_39 = [ 2.339004e-03 ; 3.321195e-03 ; 4.539108e-03 ];
Tc_error_39  = [ 2.585736e+01 ; 3.117033e+01 ; 2.055398e+01 ];

%-- Image #40:
omc_40 = [ 1.842897e+00 ; 2.004287e+00 ; -3.990377e-01 ];
Tc_40  = [ -2.072069e+03 ; -1.539939e+03 ; 1.058450e+04 ];
omc_error_40 = [ 2.401534e-03 ; 3.687087e-03 ; 5.448901e-03 ];
Tc_error_40  = [ 2.520397e+01 ; 3.051748e+01 ; 2.051391e+01 ];

%-- Image #41:
omc_41 = [ 1.861378e+00 ; 2.384500e+00 ; -2.659046e-01 ];
Tc_41  = [ -7.261902e+01 ; -1.536793e+03 ; 1.011318e+04 ];
omc_error_41 = [ 3.555096e-03 ; 5.093789e-03 ; 8.754724e-03 ];
Tc_error_41  = [ 2.398287e+01 ; 2.880573e+01 ; 1.839942e+01 ];

%-- Image #42:
omc_42 = [ 9.080442e-01 ; 2.590233e+00 ; -4.644885e-01 ];
Tc_42  = [ -5.834510e+02 ; -1.652479e+03 ; 1.085010e+04 ];
omc_error_42 = [ 1.769901e-03 ; 3.942082e-03 ; 5.775117e-03 ];
Tc_error_42  = [ 2.574907e+01 ; 3.092836e+01 ; 2.057873e+01 ];

%-- Image #43:
omc_43 = [ 7.597559e-01 ; 2.750067e+00 ; -1.530364e-01 ];
Tc_43  = [ -1.524856e+03 ; -1.597040e+03 ; 1.041389e+04 ];
omc_error_43 = [ 1.676766e-03 ; 6.179220e-03 ; 9.319934e-03 ];
Tc_error_43  = [ 2.486079e+01 ; 2.979928e+01 ; 1.994943e+01 ];

%-- Image #44:
omc_44 = [ 6.657000e-01 ; 2.085081e+00 ; -8.926479e-01 ];
Tc_44  = [ -1.523607e+03 ; -1.391706e+03 ; 1.084192e+04 ];
omc_error_44 = [ 2.027969e-03 ; 3.120379e-03 ; 3.637199e-03 ];
Tc_error_44  = [ 2.579817e+01 ; 3.101034e+01 ; 2.086603e+01 ];

%-- Image #45:
omc_45 = [ 5.951903e-01 ; 2.385665e+00 ; -1.140503e+00 ];
Tc_45  = [ -4.550957e+02 ; -1.394249e+03 ; 1.102414e+04 ];
omc_error_45 = [ 2.043719e-03 ; 3.335976e-03 ; 4.011912e-03 ];
Tc_error_45  = [ 2.611827e+01 ; 3.141765e+01 ; 2.149462e+01 ];

%-- Image #46:
omc_46 = [ -1.052898e+00 ; -2.821953e+00 ; -7.492320e-01 ];
Tc_46  = [ -1.596228e+03 ; -1.330794e+03 ; 9.328839e+03 ];
omc_error_46 = [ 2.657498e-03 ; 4.524111e-03 ; 7.266445e-03 ];
Tc_error_46  = [ 2.225544e+01 ; 2.683795e+01 ; 2.079993e+01 ];

%-- Image #47:
omc_47 = [ -5.254830e-01 ; -3.056793e+00 ; 1.592877e-01 ];
Tc_47  = [ -5.483269e+02 ; -1.294383e+03 ; 8.309091e+03 ];
omc_error_47 = [ 1.704551e-03 ; 6.402599e-03 ; 1.007055e-02 ];
Tc_error_47  = [ 1.976516e+01 ; 2.365128e+01 ; 1.531961e+01 ];

%-- Image #48:
omc_48 = [ 1.087699e+00 ; 2.915863e+00 ; -3.888295e-01 ];
Tc_48  = [ 6.104694e+02 ; -5.146133e+02 ; 6.984629e+03 ];
omc_error_48 = [ 2.428837e-03 ; 5.122450e-03 ; 8.227275e-03 ];
Tc_error_48  = [ 1.647881e+01 ; 1.985540e+01 ; 1.166567e+01 ];

%-- Image #49:
omc_49 = [ 9.191649e-01 ; 2.715363e+00 ; -9.338311e-01 ];
Tc_49  = [ 4.303807e+02 ; -1.307214e+02 ; 8.788800e+03 ];
omc_error_49 = [ 1.735664e-03 ; 3.562401e-03 ; 4.928905e-03 ];
Tc_error_49  = [ 2.072275e+01 ; 2.494468e+01 ; 1.546270e+01 ];

%-- Image #50:
omc_50 = [ 9.911365e-01 ; 2.792388e+00 ; -7.742814e-01 ];
Tc_50  = [ 2.665858e+02 ; -1.477383e+02 ; 8.446128e+03 ];
omc_error_50 = [ 1.797988e-03 ; 3.804206e-03 ; 5.607754e-03 ];
Tc_error_50  = [ 1.990509e+01 ; 2.395795e+01 ; 1.468557e+01 ];

%-- Image #51:
omc_51 = [ 1.164412e+00 ; 2.867928e+00 ; -2.723688e-01 ];
Tc_51  = [ -2.691159e+01 ; -1.463814e+02 ; 8.067356e+03 ];
omc_error_51 = [ 4.454915e-03 ; 9.125453e-03 ; 1.437324e-02 ];
Tc_error_51  = [ 1.900595e+01 ; 2.286696e+01 ; 1.350301e+01 ];

%-- Image #52:
omc_52 = [ 1.037159e+00 ; 2.865182e+00 ; -1.653466e-01 ];
Tc_52  = [ 4.439874e+01 ; -1.354638e+02 ; 7.974546e+03 ];
omc_error_52 = [ 4.506943e-03 ; 1.066777e-02 ; 1.599961e-02 ];
Tc_error_52  = [ 1.878865e+01 ; 2.261821e+01 ; 1.414357e+01 ];

%-- Image #53:
omc_53 = [ 7.003692e-01 ; 2.988392e+00 ; -1.262962e-01 ];
Tc_53  = [ 4.226171e+02 ; -1.232889e+02 ; 7.912018e+03 ];
omc_error_53 = [ 3.285125e-03 ; 1.082761e-02 ; 1.557151e-02 ];
Tc_error_53  = [ 1.863584e+01 ; 2.247699e+01 ; 1.456104e+01 ];

%-- Image #54:
omc_54 = [ 1.731180e-01 ; 3.118982e+00 ; -1.243071e-01 ];
Tc_54  = [ 9.532616e+02 ; 6.099607e+01 ; 7.862042e+03 ];
omc_error_54 = [ 1.897287e-03 ; 1.148682e-02 ; 1.616540e-02 ];
Tc_error_54  = [ 1.855779e+01 ; 2.243222e+01 ; 1.461739e+01 ];

%-- Image #55:
omc_55 = [ -4.220431e-02 ; -3.114017e+00 ; 8.370271e-02 ];
Tc_55  = [ 1.066780e+03 ; 1.322575e+02 ; 7.784389e+03 ];
omc_error_55 = [ 1.489646e-03 ; 1.333490e-02 ; 1.788347e-02 ];
Tc_error_55  = [ 1.840823e+01 ; 2.224274e+01 ; 1.573546e+01 ];

%-- Image #56:
omc_56 = [ -4.217842e-02 ; -3.112590e+00 ; 7.811664e-02 ];
Tc_56  = [ 1.066650e+03 ; 1.318099e+02 ; 7.777074e+03 ];
omc_error_56 = [ 1.475919e-03 ; 1.328123e-02 ; 1.782560e-02 ];
Tc_error_56  = [ 1.839223e+01 ; 2.222163e+01 ; 1.583103e+01 ];

%-- Image #57:
omc_57 = [ -5.416643e-02 ; -2.246694e+00 ; 2.233798e-01 ];
Tc_57  = [ 7.261765e+02 ; -6.076555e+02 ; 3.760843e+03 ];
omc_error_57 = [ 1.427646e-03 ; 2.502677e-03 ; 3.281402e-03 ];
Tc_error_57  = [ 8.911353e+00 ; 1.077424e+01 ; 6.901209e+00 ];

%-- Image #58:
omc_58 = [ -5.284284e-02 ; -2.101356e+00 ; 1.660898e-01 ];
Tc_58  = [ 5.851531e+02 ; -4.327087e+02 ; 3.592220e+03 ];
omc_error_58 = [ 1.616496e-03 ; 2.462901e-03 ; 3.062854e-03 ];
Tc_error_58  = [ 8.475481e+00 ; 1.026716e+01 ; 6.464299e+00 ];

%-- Image #59:
omc_59 = [ -3.122617e-02 ; -2.100532e+00 ; 1.778390e-01 ];
Tc_59  = [ 4.020014e+02 ; -4.450025e+02 ; 3.363387e+03 ];
omc_error_59 = [ 1.675677e-03 ; 2.451695e-03 ; 3.045762e-03 ];
Tc_error_59  = [ 7.920937e+00 ; 9.573632e+00 ; 6.021096e+00 ];

%-- Image #60:
omc_60 = [ -4.024670e-02 ; -2.111288e+00 ; 2.490832e-01 ];
Tc_60  = [ -2.073746e+02 ; -4.858844e+02 ; 3.078656e+03 ];
omc_error_60 = [ 1.907967e-03 ; 2.468119e-03 ; 2.993315e-03 ];
Tc_error_60  = [ 7.300840e+00 ; 8.738127e+00 ; 5.420569e+00 ];

%-- Image #61:
omc_61 = [ -5.048162e-02 ; -2.268307e+00 ; 2.550251e-01 ];
Tc_61  = [ -1.659562e+02 ; -4.854316e+02 ; 3.089167e+03 ];
omc_error_61 = [ 1.734680e-03 ; 2.501689e-03 ; 3.258197e-03 ];
Tc_error_61  = [ 7.320626e+00 ; 8.761692e+00 ; 5.388684e+00 ];

%-- Image #62:
omc_62 = [ 7.681829e-02 ; 2.304633e+00 ; 5.349747e-01 ];
Tc_62  = [ 1.708582e+02 ; -4.487869e+02 ; 3.125872e+03 ];
omc_error_62 = [ 1.522587e-03 ; 2.419563e-03 ; 3.383044e-03 ];
Tc_error_62  = [ 7.354838e+00 ; 8.847884e+00 ; 5.244404e+00 ];

%-- Image #63:
omc_63 = [ -7.565671e-02 ; 2.893435e+00 ; 3.282505e-01 ];
Tc_63  = [ 9.865325e+02 ; -2.807282e+02 ; 3.379548e+03 ];
omc_error_63 = [ 1.069548e-03 ; 2.772545e-03 ; 4.658573e-03 ];
Tc_error_63  = [ 8.013959e+00 ; 9.789093e+00 ; 6.202327e+00 ];

%-- Image #64:
omc_64 = [ 8.332130e-02 ; 2.790850e+00 ; 4.814368e-01 ];
Tc_64  = [ 8.630078e+02 ; -3.603454e+02 ; 3.277187e+03 ];
omc_error_64 = [ 1.250206e-03 ; 2.628527e-03 ; 4.311424e-03 ];
Tc_error_64  = [ 7.760129e+00 ; 9.446896e+00 ; 6.056227e+00 ];

%-- Image #65:
omc_65 = [ 3.960434e-01 ; 2.739729e+00 ; -1.327427e-01 ];
Tc_65  = [ 4.377781e+02 ; -5.709180e+02 ; 3.801449e+03 ];
omc_error_65 = [ 1.060090e-03 ; 2.629843e-03 ; 4.329739e-03 ];
Tc_error_65  = [ 8.953593e+00 ; 1.083279e+01 ; 6.310538e+00 ];

%-- Image #66:
omc_66 = [ 3.010053e-01 ; 2.795449e+00 ; -2.660441e-01 ];
Tc_66  = [ 5.171900e+02 ; -6.065953e+02 ; 3.926872e+03 ];
omc_error_66 = [ 9.907698e-04 ; 2.698623e-03 ; 4.438043e-03 ];
Tc_error_66  = [ 9.260702e+00 ; 1.120789e+01 ; 6.490010e+00 ];

%-- Image #67:
omc_67 = [ -6.410386e-03 ; 2.874388e+00 ; -8.723935e-01 ];
Tc_67  = [ 1.026938e+03 ; -5.732527e+02 ; 4.273946e+03 ];
omc_error_67 = [ 1.449208e-03 ; 2.925151e-03 ; 4.422721e-03 ];
Tc_error_67  = [ 1.015641e+01 ; 1.238913e+01 ; 7.325132e+00 ];

%-- Image #68:
omc_68 = [ -2.710303e-01 ; -2.977551e+00 ; 1.888898e-01 ];
Tc_68  = [ 8.659668e+02 ; -5.531988e+02 ; 3.923262e+03 ];
omc_error_68 = [ 9.564504e-04 ; 6.480390e-03 ; 7.481755e-03 ];
Tc_error_68  = [ 9.327778e+00 ; 1.129353e+01 ; 7.068503e+00 ];

%-- Image #69:
omc_69 = [ 1.235918e-01 ; 2.459936e+00 ; -1.195203e+00 ];
Tc_69  = [ 9.161238e+01 ; -5.338723e+02 ; 4.028720e+03 ];
omc_error_69 = [ 1.667140e-03 ; 2.768744e-03 ; 3.615670e-03 ];
Tc_error_69  = [ 9.532732e+00 ; 1.144816e+01 ; 5.909530e+00 ];

%-- Image #70:
omc_70 = [ 1.089343e-01 ; 2.534697e+00 ; -1.144182e+00 ];
Tc_70  = [ 1.091915e+02 ; -5.578914e+02 ; 3.981396e+03 ];
omc_error_70 = [ 1.581311e-03 ; 2.742323e-03 ; 3.730623e-03 ];
Tc_error_70  = [ 9.423228e+00 ; 1.131049e+01 ; 5.901094e+00 ];

%-- Image #71:
omc_71 = [ 1.964118e-01 ; 2.878725e+00 ; -2.273167e-01 ];
Tc_71  = [ 2.098520e+02 ; -5.964557e+02 ; 3.636611e+03 ];
omc_error_71 = [ 6.937275e-04 ; 2.878528e-03 ; 4.789851e-03 ];
Tc_error_71  = [ 8.584162e+00 ; 1.030665e+01 ; 5.988855e+00 ];

%-- Image #72:
omc_72 = [ 2.796010e-01 ; 2.593683e+00 ; -1.022740e+00 ];
Tc_72  = [ 3.057086e+02 ; -4.419998e+02 ; 4.375491e+03 ];
omc_error_72 = [ 1.399553e-03 ; 2.816449e-03 ; 3.761857e-03 ];
Tc_error_72  = [ 1.031847e+01 ; 1.243782e+01 ; 6.603405e+00 ];

%-- Image #73:
omc_73 = [ -2.622842e-01 ; -2.874684e+00 ; 2.489881e-02 ];
Tc_73  = [ 9.871831e+02 ; -6.463714e+02 ; 4.109260e+03 ];
omc_error_73 = [ 8.062700e-04 ; 5.417742e-03 ; 6.314502e-03 ];
Tc_error_73  = [ 9.833720e+00 ; 1.187600e+01 ; 7.720994e+00 ];

%-- Image #74:
omc_74 = [ -3.157768e-01 ; -2.930065e+00 ; 6.616732e-03 ];
Tc_74  = [ 8.444466e+02 ; -6.256372e+02 ; 4.084498e+03 ];
omc_error_74 = [ 8.308556e-04 ; 5.788240e-03 ; 6.749242e-03 ];
Tc_error_74  = [ 9.741037e+00 ; 1.175271e+01 ; 7.682719e+00 ];

%-- Image #75:
omc_75 = [ -3.221887e-01 ; -3.014280e+00 ; 5.912583e-03 ];
Tc_75  = [ 6.739849e+02 ; -6.380542e+02 ; 4.009279e+03 ];
omc_error_75 = [ 8.135959e-04 ; 5.863177e-03 ; 7.017551e-03 ];
Tc_error_75  = [ 9.526787e+00 ; 1.147328e+01 ; 7.468485e+00 ];

%-- Image #76:
omc_76 = [ 2.915331e-01 ; 3.087086e+00 ; -6.991014e-02 ];
Tc_76  = [ 5.272502e+02 ; -6.563223e+02 ; 3.982414e+03 ];
omc_error_76 = [ 7.130478e-04 ; 4.256243e-03 ; 6.402302e-03 ];
Tc_error_76  = [ 9.406179e+00 ; 1.134355e+01 ; 7.024549e+00 ];

%-- Image #77:
omc_77 = [ 2.566490e-01 ; 2.780336e+00 ; -5.960276e-02 ];
Tc_77  = [ 1.814247e+02 ; -5.777880e+02 ; 3.608573e+03 ];
omc_error_77 = [ 8.171134e-04 ; 2.753596e-03 ; 4.479193e-03 ];
Tc_error_77  = [ 8.509838e+00 ; 1.023095e+01 ; 5.978954e+00 ];

%-- Image #78:
omc_78 = [ 8.811235e-02 ; 2.314690e+00 ; -5.505863e-02 ];
Tc_78  = [ -1.078679e+02 ; -4.852233e+02 ; 3.263318e+03 ];
omc_error_78 = [ 1.333563e-03 ; 2.384693e-03 ; 3.431867e-03 ];
Tc_error_78  = [ 7.732998e+00 ; 9.244136e+00 ; 5.061100e+00 ];

%-- Image #79:
omc_79 = [ 2.109778e-01 ; 2.265167e+00 ; -4.424234e-02 ];
Tc_79  = [ -2.212329e+02 ; -5.460917e+02 ; 3.356046e+03 ];
omc_error_79 = [ 1.367741e-03 ; 2.359970e-03 ; 3.341394e-03 ];
Tc_error_79  = [ 7.968986e+00 ; 9.519136e+00 ; 5.278192e+00 ];


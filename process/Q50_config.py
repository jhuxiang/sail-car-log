def LoadParameters(name):
    if name == 'q50_4_2_14_params':
        from parameters.q50_4_3_14_params import GetQ50Params
        return GetQ50Params()
    elif name == 'q50_3_7_14_params':
        from parameters.q50_3_7_14_params import GetQ50Params
        return GetQ50Params()
    else:
        return 'unknown name'



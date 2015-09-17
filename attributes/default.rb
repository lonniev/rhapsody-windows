# https://www15.software.ibm.com/sdfdl/v2/fulfill
# /CN5IJML/Xa.2/Xb.GUsb5m8rB11lxenD7rjhwY0W_pmojqGLlqi-8vvZank
# /Xc.CN5IJML/Rhapsody_eval_8.1.3_Windows_32.zip/Xd./Xf.LPR.D1VC
# /Xg.8266743/Xi.RATLe-RHAPDEV-EVAL/XY.regsrvs/XZ.Mv1Tmh4owj5-DKW-yV04Yihhxs8
# /Rhapsody_eval_8.1.3_Windows_32.zip

default['rhapsody-windows'] =
  {
    :version => "8.1.3",
    :scheme => "https",
    :host =>  "www15.software.ibm.com",
    :arch => "Windows_32",
    :product => "Rhapsody_eval",
    :compression => "zip",
    :path_preamble => "/sdfdl/v2/fulfill/CN5IJML/Xa.2/Xb.GUsb5m8rB11lxenD7rjhwY0W_pmojqGLlqi-8vvZank/Xc.CN5IJML",
    :path_suffix => "/Xd./Xf.LPR.D1VC/Xg.8266743/Xi.RATLe-RHAPDEV-EVAL/XY.regsrvs/XZ.Mv1Tmh4owj5-DKW-yV04Yihhxs8",
    
    :query => {},
      
    :unzip_to => "/tmp",
    
    :license_variable => "27000@rlia-tls.atsodius.com" 
  }
import GraphicsGpuComputingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GPUComputePlatform where
  vendor : String
  architecture : String
  computeCapability : Nat

data ComputeAdmittedObject where
  warpSize : Nat
  sharedMemoryBytes : Nat
  registerFileSize : Nat
  computeUnits : Nat
  maxThreadsPerBlock : Nat
  warpSchedulingPolicy : String
  instructionPipelines : Nat
  tensorCoreUnits : Nat
  memoryBandwidthGBs : Float
  clockSpeedMHz : Float

abbrev ComputeWitnessClosed (O : ComputeAdmittedObject) : Prop := True

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
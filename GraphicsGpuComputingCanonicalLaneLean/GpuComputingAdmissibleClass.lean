import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuAdmittedObject where
  pipeline : GpuShaderPipeline
  architecture : ParallelComputeArchitecture
  memory : MemoryHierarchy
  optimization : ComputeShaderOptimization
  kernel : GpuKernelExecution
  graphicsState : GraphicsPipelineState
  gpuComputingValidated : Prop
  conclusion : gpuComputingValidated

structure GpuComputingEndgameState where
  object : GpuAdmittedObject

def GpuWitnessClosed (O : GpuAdmittedObject) : Prop :=
  O.gpuComputingValidated

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

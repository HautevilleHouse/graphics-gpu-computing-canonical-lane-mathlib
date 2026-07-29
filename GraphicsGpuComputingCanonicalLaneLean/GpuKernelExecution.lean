import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuKernelExecution where
  kernelName : String
  gridDimensions : Nat × Nat × Nat
  blockDimensions : Nat × Nat × Nat
  sharedMemoryPerBlock : Nat
  registersPerThread : Nat
  executionTime : Nat
  occupancy : Float
  executionCompleted : Prop
  executionCompletedTerm : executionCompleted

structure GpuKernelExecutionEvidence (K : GpuKernelExecution) where
  executionCompletedClosed : K.executionCompleted

def GpuKernelExecutionClosed (K : GpuKernelExecution) : Prop :=
  K.executionCompleted

theorem gpu_kernel_execution_closed_from_evidence
    (K : GpuKernelExecution) (E : GpuKernelExecutionEvidence K) :
    GpuKernelExecutionClosed K := by
  exact E.executionCompletedClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

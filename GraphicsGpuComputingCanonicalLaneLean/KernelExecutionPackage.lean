import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsGpuComputingCanonicalLaneLean.GpuComputeCore

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure KernelExecutionPackage (C : GpuComputeCore) where
  warpScheduler : Prop
  divergenceHandling : Prop
  resourceAllocation : Prop
  executionConvergence : Prop
  warpSchedulerClosed : warpScheduler
  divergenceHandlingClosed : divergenceHandling
  resourceAllocationClosed : resourceAllocation
  executionConvergenceClosed : executionConvergence

structure KernelExecutionEvidence {C : GpuComputeCore} (K : KernelExecutionPackage C) where
  warpSchedulerClosed : K.warpScheduler
  divergenceHandlingClosed : K.divergenceHandling
  resourceAllocationClosed : K.resourceAllocation
  executionConvergenceClosed : K.executionConvergence

def KernelExecutionClosed {C : GpuComputeCore} (K : KernelExecutionPackage C) : Prop :=
  K.warpScheduler ∧ K.divergenceHandling ∧ K.resourceAllocation ∧ K.executionConvergence

theorem kernel_execution_closed_from_evidence {C : GpuComputeCore} (K : KernelExecutionPackage C) (E : KernelExecutionEvidence K) : KernelExecutionClosed K := by
  exact And.intro E.warpSchedulerClosed (And.intro E.divergenceHandlingClosed (And.intro E.resourceAllocationClosed E.executionConvergenceClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
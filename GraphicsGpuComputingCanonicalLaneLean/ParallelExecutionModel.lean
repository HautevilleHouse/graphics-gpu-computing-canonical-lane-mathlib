import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ParallelExecutionModelPackage where
  threadMapping : Prop
  barrierSynchronization : Prop
  divergenceHandling : Prop
  warpScheduling : Prop

structure ParallelExecutionModelEvidence (P : ParallelExecutionModelPackage) where
  threadMappingClosed : P.threadMapping
  barrierSynchronizationClosed : P.barrierSynchronization
  divergenceHandlingClosed : P.divergenceHandling
  warpSchedulingClosed : P.warpScheduling

def ParallelExecutionModelClosed (P : ParallelExecutionModelPackage) : Prop :=
  P.threadMapping ∧ P.barrierSynchronization ∧ P.divergenceHandling ∧ P.warpScheduling

theorem parallel_execution_model_closed_from_evidence (P : ParallelExecutionModelPackage)
    (E : ParallelExecutionModelEvidence P) : ParallelExecutionModelClosed P := by
  exact And.intro E.threadMappingClosed (And.intro E.barrierSynchronizationClosed
    (And.intro E.divergenceHandlingClosed E.warpSchedulingClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

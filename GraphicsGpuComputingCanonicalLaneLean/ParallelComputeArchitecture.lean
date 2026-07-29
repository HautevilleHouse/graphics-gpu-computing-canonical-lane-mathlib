import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ParallelComputeArchitecture where
  warpsPerMultiprocessor : Nat
  threadsPerWarp : Nat
  sharedMemorySize : Nat
  constantMemorySize : Nat
  registersPerThread : Nat
  memoryBandwidth : Nat
  computeCapability : String
  occupancyComputed : Prop
  occupancyComputedTerm : occupancyComputed

structure ParallelComputeArchitectureEvidence (A : ParallelComputeArchitecture) where
  occupancyComputedClosed : A.occupancyComputed

def ParallelComputeArchitectureClosed (A : ParallelComputeArchitecture) : Prop :=
  A.occupancyComputed

theorem parallel_compute_architecture_closed_from_evidence
    (A : ParallelComputeArchitecture)
    (E : ParallelComputeArchitectureEvidence A) :
    ParallelComputeArchitectureClosed A := by
  exact E.occupancyComputedClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuComputeObject where
  computeUnit : Type
  memoryHierarchy : Type
  kernelExecution : Prop
  dataParallelism : Prop
  synchronization : Prop

structure GpuComputePackage where
  computeObject : GpuComputeObject
  workGroupSizeLimited : Prop
  memoryCoalescingAchieved : Prop
  occupancyOptimal : Prop
  bankConflictFree : Prop

structure GpuComputeEvidence (G : GpuComputePackage) where
  workGroupSizeLimitedClosed : G.workGroupSizeLimited
  memoryCoalescingAchievedClosed : G.memoryCoalescingAchieved
  occupancyOptimalClosed : G.occupancyOptimal
  bankConflictFreeClosed : G.bankConflictFree

def GpuComputeClosed (G : GpuComputePackage) : Prop :=
  G.workGroupSizeLimited ∧ G.memoryCoalescingAchieved ∧
  G.occupancyOptimal ∧ G.bankConflictFree

theorem gpu_compute_closed_from_evidence (G : GpuComputePackage) (E : GpuComputeEvidence G) : GpuComputeClosed G := by
  exact And.intro E.workGroupSizeLimitedClosed
    (And.intro E.memoryCoalescingAchievedClosed
      (And.intro E.occupancyOptimalClosed E.bankConflictFreeClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

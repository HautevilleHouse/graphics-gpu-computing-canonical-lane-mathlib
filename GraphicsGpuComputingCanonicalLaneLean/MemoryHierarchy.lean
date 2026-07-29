import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure MemoryHierarchy where
  globalMemorySize : Nat
  globalMemoryBandwidth : Nat
  L1CacheSize : Nat
  L2CacheSize : Nat
  registerFileSize : Nat
  memoryCoalescing : Prop
  bankConflictFree : Prop
  memoryCoalescingTerm : memoryCoalescing
  bankConflictFreeTerm : bankConflictFree

structure MemoryHierarchyEvidence (M : MemoryHierarchy) where
  memoryCoalescingClosed : M.memoryCoalescing
  bankConflictFreeClosed : M.bankConflictFree

def MemoryHierarchyClosed (M : MemoryHierarchy) : Prop :=
  M.memoryCoalescing ∧ M.bankConflictFree

theorem memory_hierarchy_closed_from_evidence
    (M : MemoryHierarchy) (E : MemoryHierarchyEvidence M) :
    MemoryHierarchyClosed M := by
  exact And.intro E.memoryCoalescingClosed E.bankConflictFreeClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

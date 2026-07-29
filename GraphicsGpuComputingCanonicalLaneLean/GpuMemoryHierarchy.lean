import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuMemoryHierarchy where
  globalMemory : Type
  sharedMemory : Type
  localMemory : Type
  textureMemory : Type
  constantMemory : Type
  memoryCoalesced : Prop
  bandwidthUtilized : Prop
  globalMemoryClosed : globalMemory
  sharedMemoryClosed : sharedMemory
  localMemoryClosed : localMemory
  textureMemoryClosed : textureMemory
  constantMemoryClosed : constantMemory
  memoryCoalescedClosed : memoryCoalesced
  bandwidthUtilizedClosed : bandwidthUtilized

structure GpuMemoryEvidence (M : GpuMemoryHierarchy) where
  globalMemoryClosed : M.globalMemory
  sharedMemoryClosed : M.sharedMemory
  localMemoryClosed : M.localMemory
  textureMemoryClosed : M.textureMemory
  constantMemoryClosed : M.constantMemory
  memoryCoalescedClosed : M.memoryCoalesced
  bandwidthUtilizedClosed : M.bandwidthUtilized

def GpuMemoryClosed (M : GpuMemoryHierarchy) : Prop :=
  M.globalMemory ∧ M.sharedMemory ∧ M.localMemory ∧ M.textureMemory ∧ M.constantMemory ∧ M.memoryCoalesced ∧ M.bandwidthUtilized

theorem gpu_memory_closed_from_evidence (M : GpuMemoryHierarchy) (E : GpuMemoryEvidence M) : GpuMemoryClosed M := by
  exact And.intro E.globalMemoryClosed (And.intro E.sharedMemoryClosed (And.intro E.localMemoryClosed (And.intro E.textureMemoryClosed (And.intro E.constantMemoryClosed (And.intro E.memoryCoalescedClosed E.bandwidthUtilizedClosed)))))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GlobalMemoryAccess where
  coalescingPattern : Prop
  alignmentRequirement : Prop
  bandwidthUtilization : Prop

structure SharedMemoryAccess where
  bankMapping : Prop
  conflictResolution : Prop
  scratchpadUsage : Prop

structure MemoryAccessPackage where
  globalAccess : GlobalMemoryAccess
  sharedAccess : SharedMemoryAccess
  cacheCoherence : Prop
  prefetchEffectiveness : Prop

structure MemoryAccessEvidence (M : MemoryAccessPackage) where
  globalAccessClosed : M.globalAccess.coalescingPattern ∧ M.globalAccess.alignmentRequirement ∧ M.globalAccess.bandwidthUtilization
  sharedAccessClosed : M.sharedAccess.bankMapping ∧ M.sharedAccess.conflictResolution ∧ M.sharedAccess.scratchpadUsage
  cacheCoherenceClosed : M.cacheCoherence
  prefetchEffectivenessClosed : M.prefetchEffectiveness

def MemoryAccessClosed (M : MemoryAccessPackage) : Prop :=
  (M.globalAccess.coalescingPattern ∧ M.globalAccess.alignmentRequirement ∧ M.globalAccess.bandwidthUtilization) ∧
  (M.sharedAccess.bankMapping ∧ M.sharedAccess.conflictResolution ∧ M.sharedAccess.scratchpadUsage) ∧
  M.cacheCoherence ∧ M.prefetchEffectiveness

theorem memory_access_closed_from_evidence (M : MemoryAccessPackage) (E : MemoryAccessEvidence M) : MemoryAccessClosed M := by
  exact And.intro E.globalAccessClosed
    (And.intro E.sharedAccessClosed
      (And.intro E.cacheCoherenceClosed E.prefetchEffectivenessClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure WarpSchedulingPackage where
  warpSize : Nat
  threadMapping : Prop
  simdUtilization : Prop
  branchDivergenceMitigation : Prop
  latencyHiding : Prop

structure WarpSchedulingEvidence (W : WarpSchedulingPackage) where
  threadMappingClosed : W.threadMapping
  simdUtilizationClosed : W.simdUtilization
  branchDivergenceMitigationClosed : W.branchDivergenceMitigation
  latencyHidingClosed : W.latencyHiding

def WarpSchedulingClosed (W : WarpSchedulingPackage) : Prop :=
  W.threadMapping ∧ W.simdUtilization ∧
  W.branchDivergenceMitigation ∧ W.latencyHiding

theorem warp_scheduling_closed_from_evidence (W : WarpSchedulingPackage) (E : WarpSchedulingEvidence W) : WarpSchedulingClosed W := by
  exact And.intro E.threadMappingClosed
    (And.intro E.simdUtilizationClosed
      (And.intro E.branchDivergenceMitigationClosed E.latencyHidingClosed))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

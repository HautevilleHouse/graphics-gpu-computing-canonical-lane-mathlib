import canonicalLaneMathlib.AdmissibleClass
import GraphicsGpuComputingCanonicalLaneLean.GpuComputeModel
import GraphicsGpuComputingCanonicalLaneLean.WarpScheduling
import GraphicsGpuComputingCanonicalLaneLean.MemoryAccess

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

def ConstrainedGpuComputingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gpu_computing_endgame (A : AdmissibleClass) : ConstrainedGpuComputingClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

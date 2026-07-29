import GraphicsGpuComputingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

def bridgeClosed (A : GraphicsGpuAdmittedObject) : Prop :=
  A.correctness

theorem bridge_from_admissible_class (A : GraphicsGpuAdmittedObject) :
    bridgeClosed A := by
  exact A.conclusion

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
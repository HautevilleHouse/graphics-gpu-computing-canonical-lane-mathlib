import GraphicsGpuComputingCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

def gateClosed (A : GraphicsGpuAdmittedObject) : Prop :=
  A.terminates ∨ A.correctness

theorem gate_from_admissible_class (A : GraphicsGpuAdmittedObject) :
    gateClosed A := by
  exact Or.inr A.conclusion

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
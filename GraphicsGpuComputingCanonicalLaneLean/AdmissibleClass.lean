import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GraphicsGpuAdmittedObject where
  gpuModel : Type
  computationModel : Type
  program : Type
  input : Type
  output : Type
  terminates : Prop
  correctness : Prop
  conclusion : correctness

def admittedClosure (A : GraphicsGpuAdmittedObject) : Prop :=
  A.correctness

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
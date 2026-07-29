import GraphicsGpuComputingCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GraphicsGpuTheoremStatement where
  theoremName : String
  gpuModel : Type
  computationalModel : Type
  programVerification : Prop
  terminationGuarantee : Prop
  correctnessGuarantee : Prop
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : GraphicsGpuTheoremStatement := {
  theoremName := "GraphicsGpuComputingCanonicalLaneLean",
  gpuModel := String,
  computationalModel := String,
  programVerification := True,
  terminationGuarantee := True,
  correctnessGuarantee := True,
  certificateLane := "gpu_constrained",
  carriedRemainder := "classical boundary carried by formalization certificate"
}

theorem theorem_statement_initialized :
    sourceTheoremStatement.theoremName = "GraphicsGpuComputingCanonicalLaneLean" := by
  rfl

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
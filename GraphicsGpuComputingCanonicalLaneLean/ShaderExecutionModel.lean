import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ShaderExecutionModel where
  vertexShader : Type
  fragmentShader : Type
  geometryShader : Type
  computeShader : Type
  pipelineCompiled : Prop
  vertexShaderClosed : vertexShader
  fragmentShaderClosed : fragmentShader
  geometryShaderClosed : geometryShader
  computeShaderClosed : computeShader
  pipelineCompiledClosed : pipelineCompiled

structure ShaderExecutionEvidence (S : ShaderExecutionModel) where
  vertexShaderClosed : S.vertexShader
  fragmentShaderClosed : S.fragmentShader
  geometryShaderClosed : S.geometryShader
  computeShaderClosed : S.computeShader
  pipelineCompiledClosed : S.pipelineCompiled

def ShaderExecutionClosed (S : ShaderExecutionModel) : Prop :=
  S.vertexShader ∧ S.fragmentShader ∧ S.geometryShader ∧ S.computeShader ∧ S.pipelineCompiled

theorem shader_execution_closed_from_evidence (S : ShaderExecutionModel) (E : ShaderExecutionEvidence S) : ShaderExecutionClosed S := by
  exact And.intro E.vertexShaderClosed (And.intro E.fragmentShaderClosed (And.intro E.geometryShaderClosed (And.intro E.computeShaderClosed E.pipelineCompiledClosed)))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GpuShaderPipeline where
  vertexShader : Type
  fragmentShader : Type
  geometryShader : Type
  tessellationControl : Type
  tessellationEvaluation : Type
  computeShader : Type
  pipelineCompiled : Prop
  pipelineExecutable : Prop
  pipelineCompiledTerm : pipelineCompiled
  pipelineExecutableTerm : pipelineExecutable

structure GpuShaderPipelineEvidence (P : GpuShaderPipeline) where
  pipelineCompiledClosed : P.pipelineCompiled
  pipelineExecutableClosed : P.pipelineExecutable

def GpuShaderPipelineClosed (P : GpuShaderPipeline) : Prop :=
  P.pipelineCompiled ∧ P.pipelineExecutable

theorem gpu_shader_pipeline_closed_from_evidence
    (P : GpuShaderPipeline) (E : GpuShaderPipelineEvidence P) :
    GpuShaderPipelineClosed P := by
  exact And.intro E.pipelineCompiledClosed E.pipelineExecutableClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

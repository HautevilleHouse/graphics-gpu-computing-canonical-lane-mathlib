import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GraphicsPipeline where
  vertexProcessing : Type
  primitiveAssembly : Type
  rasterization : Type
  fragmentProcessing : Type
  outputMerger : Type
  pipelineState : Prop
  vertexProcessingClosed : vertexProcessing
  primitiveAssemblyClosed : primitiveAssembly
  rasterizationClosed : rasterization
  fragmentProcessingClosed : fragmentProcessing
  outputMergerClosed : outputMerger
  pipelineStateClosed : pipelineState

structure GraphicsPipelineEvidence (G : GraphicsPipeline) where
  vertexProcessingClosed : G.vertexProcessing
  primitiveAssemblyClosed : G.primitiveAssembly
  rasterizationClosed : G.rasterization
  fragmentProcessingClosed : G.fragmentProcessing
  outputMergerClosed : G.outputMerger
  pipelineStateClosed : G.pipelineState

def GraphicsPipelineClosed (G : GraphicsPipeline) : Prop :=
  G.vertexProcessing ∧ G.primitiveAssembly ∧ G.rasterization ∧ G.fragmentProcessing ∧ G.outputMerger ∧ G.pipelineState

theorem graphics_pipeline_closed_from_evidence (G : GraphicsPipeline) (E : GraphicsPipelineEvidence G) : GraphicsPipelineClosed G := by
  exact And.intro E.vertexProcessingClosed (And.intro E.primitiveAssemblyClosed (And.intro E.rasterizationClosed (And.intro E.fragmentProcessingClosed (And.intro E.outputMergerClosed E.pipelineStateClosed))))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
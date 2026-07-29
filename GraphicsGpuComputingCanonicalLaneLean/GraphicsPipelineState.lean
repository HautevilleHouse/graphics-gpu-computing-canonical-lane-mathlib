import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure GraphicsPipelineState where
  inputAssembler : Type
  vertexShaderStage : Type
  rasterizer : Type
  fragmentShaderStage : Type
  outputMerger : Type
  depthStencilTest : Prop
  blendEnabled : Prop
  viewportSet : Prop
  depthStencilTestTerm : depthStencilTest
  blendEnabledTerm : blendEnabled
  viewportSetTerm : viewportSet

structure GraphicsPipelineStateEvidence (G : GraphicsPipelineState) where
  depthStencilTestClosed : G.depthStencilTest
  blendEnabledClosed : G.blendEnabled
  viewportSetClosed : G.viewportSet

def GraphicsPipelineStateClosed (G : GraphicsPipelineState) : Prop :=
  G.depthStencilTest ∧ G.blendEnabled ∧ G.viewportSet

theorem graphics_pipeline_state_closed_from_evidence
    (G : GraphicsPipelineState) (E : GraphicsPipelineStateEvidence G) :
    GraphicsPipelineStateClosed G := by
  exact And.intro E.depthStencilTestClosed
    (And.intro E.blendEnabledClosed E.viewportSetClosed)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

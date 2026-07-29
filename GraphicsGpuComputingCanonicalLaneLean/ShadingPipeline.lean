import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ShadingPipelinePackage where
  vertexShader : Prop
  tessellation : Prop
  geometryShader : Prop
  rasterization : Prop
  fragmentShader : Prop
  computeShader : Prop

structure ShadingPipelineEvidence (S : ShadingPipelinePackage) where
  vertexShaderClosed : S.vertexShader
  tessellationClosed : S.tessellation
  geometryShaderClosed : S.geometryShader
  rasterizationClosed : S.rasterization
  fragmentShaderClosed : S.fragmentShader
  computeShaderClosed : S.computeShader

def ShadingPipelineClosed (S : ShadingPipelinePackage) : Prop :=
  S.vertexShader ∧ S.tessellation ∧ S.geometryShader ∧ S.rasterization ∧ S.fragmentShader ∧ S.computeShader

theorem shading_pipeline_closed_from_evidence (S : ShadingPipelinePackage)
    (E : ShadingPipelineEvidence S) : ShadingPipelineClosed S := by
  exact And.intro E.vertexShaderClosed (And.intro E.tessellationClosed
    (And.intro E.geometryShaderClosed (And.intro E.rasterizationClosed
      (And.intro E.fragmentShaderClosed E.computeShaderClosed))))

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

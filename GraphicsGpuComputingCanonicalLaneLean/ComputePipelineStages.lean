import GraphicsGpuComputingCanonicalLaneLean.GPUComputeObjects

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ComputePipelineStage where
  stageName : String
  inputType : String
  outputType : String
  bindingModel : String
  shaderStageMask : Nat

structure ComputePipelineStageEvidence (s : ComputePipelineStage) where
  stageNameClosed : s.stageName = s.stageName
  bindingModelClosed : s.bindingModel = s.bindingModel

def ComputePipelineStageClosed (s : ComputePipelineStage) : Prop :=
  s.stageName = s.stageName ∧ s.bindingModel = s.bindingModel

theorem compute_pipeline_stage_closed_from_evidence (s : ComputePipelineStage)
    (e : ComputePipelineStageEvidence s) : ComputePipelineStageClosed s := by
  exact And.intro e.stageNameClosed e.bindingModelClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
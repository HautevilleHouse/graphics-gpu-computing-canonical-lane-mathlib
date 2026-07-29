import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ComputeShaderOptimization where
  threadBlockSize : Nat
  gridSize : Nat
  sharedMemoryUsage : Nat
  registerPressure : Nat
  instructionLevelParallelism : Prop
  divergenceFree : Prop
  instructionLevelParallelismTerm : instructionLevelParallelism
  divergenceFreeTerm : divergenceFree

structure ComputeShaderOptimizationEvidence (C : ComputeShaderOptimization) where
  instructionLevelParallelismClosed : C.instructionLevelParallelism
  divergenceFreeClosed : C.divergenceFree

def ComputeShaderOptimizationClosed (C : ComputeShaderOptimization) : Prop :=
  C.instructionLevelParallelism ∧ C.divergenceFree

theorem compute_shader_optimization_closed_from_evidence
    (C : ComputeShaderOptimization)
    (E : ComputeShaderOptimizationEvidence C) :
    ComputeShaderOptimizationClosed C := by
  exact And.intro E.instructionLevelParallelismClosed E.divergenceFreeClosed

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse

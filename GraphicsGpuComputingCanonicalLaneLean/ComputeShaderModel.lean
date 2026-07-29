import GraphicsGpuComputingCanonicalLaneLean.GPUComputeObjects
import GraphicsGpuComputingCanonicalLaneLean.MemoryHierarchy

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ComputeShaderProgram where
  kernelFunction : String
  threadBlockShape : (Nat × Nat × Nat)
  gridShape : (Nat × Nat × Nat)
  sharedMemoryUsage : Nat
  registerPressure : Nat
  instructionCount : Nat

structure ComputeShaderEvidence (s : ComputeShaderProgram) where
  threadBlockClosed : s.threadBlockShape.1 > 0 ∧ s.threadBlockShape.2.1 > 0 ∧ s.threadBlockShape.2.2 > 0
  gridClosed : s.gridShape.1 > 0 ∧ s.gridShape.2.1 > 0 ∧ s.gridShape.2.2 > 0
  sharedMemoryWithinLimit : s.sharedMemoryUsage ≤ 49152

def ComputeShaderClosed (s : ComputeShaderProgram) : Prop :=
  (s.threadBlockShape.1 > 0 ∧ s.threadBlockShape.2.1 > 0 ∧ s.threadBlockShape.2.2 > 0) ∧
  (s.gridShape.1 > 0 ∧ s.gridShape.2.1 > 0 ∧ s.gridShape.2.2 > 0) ∧
  s.sharedMemoryUsage ≤ 49152

theorem compute_shader_closed_from_evidence (s : ComputeShaderProgram)
    (e : ComputeShaderEvidence s) : ComputeShaderClosed s := by
  exact And.intro e.threadBlockClosed (And.intro e.gridClosed e.sharedMemoryWithinLimit)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
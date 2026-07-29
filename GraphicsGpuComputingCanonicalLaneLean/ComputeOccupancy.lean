import GraphicsGpuComputingCanonicalLaneLean.GPUComputeObjects
import GraphicsGpuComputingCanonicalLaneLean.MemoryHierarchy
import GraphicsGpuComputingCanonicalLaneLean.ComputeShaderModel

namespace HautevilleHouse
namespace GraphicsGpuComputingCanonicalLaneLean

structure ComputeOccupancy where
  maxThreadsPerSM : Nat
  maxRegistersPerSM : Nat
  maxSharedMemoryPerSM : Nat
  activeWarps : Nat
  activeThreads : Nat
  theoreticalOccupancy : Float

structure ComputeOccupancyEvidence (o : ComputeOccupancy) where
  maxThreadsClosed : o.maxThreadsPerSM > 0
  activeWarpsClosed : o.activeWarps > 0
  occupancyFraction : o.theoreticalOccupancy > 0.0

def ComputeOccupancyClosed (o : ComputeOccupancy) : Prop :=
  o.maxThreadsPerSM > 0 ∧ o.activeWarps > 0 ∧ o.theoreticalOccupancy > 0.0

theorem compute_occupancy_closed_from_evidence (o : ComputeOccupancy)
    (e : ComputeOccupancyEvidence o) : ComputeOccupancyClosed o := by
  exact And.intro e.maxThreadsClosed (And.intro e.activeWarpsClosed e.occupancyFraction)

end GraphicsGpuComputingCanonicalLaneLean
end HautevilleHouse
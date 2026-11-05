module

public import Chapter05QuadraticScale

/-! A clipped sufficient scale for convex C² quadratic cuts. Global ambient convexity and C² regularity are required. The anchor need not lie in B. The scale is not claimed maximal, positive or computable. -/
@[expose] public section
noncomputable section
open scoped BigOperators
open Set

namespace PalomarQuadratic
open Chapter05.Quadratic

theorem solution {n p : ℕ}
    {f : Chapter02.RealVector (n+p) → ℝ} (hconv : ConvexOn ℝ univ f)
    (hC2 : ContDiff ℝ 2 f) (a : Chapter02.RealVector (n+p))
    (B : Set (Chapter02.RealVector (n+p))) :
    (0 ≤ safeScale f a B ∧ safeScale f a B ≤ 1) ∧
      ∀ α : ℝ, 0 ≤ α → α ≤ safeScale f a B →
        ∀ x ∈ B, tangent f a x ≤ cut f a α x ∧ cut f a α x ≤ f x ∧
          cut f a α x ≤ cut f a 1 x := by
  exact Chapter05.Quadratic.source_joint_safeScale hconv hC2 a B

end PalomarQuadratic

module

public import Mathlib.Algebra.Order.Floor.Ring
public import Mathlib.Analysis.Calculus.ContDiff.Basic
public import Mathlib.Analysis.Calculus.ContDiff.Comp
public import Mathlib.Analysis.Calculus.Deriv.AffineMap
public import Mathlib.Analysis.Calculus.Deriv.Comp
public import Mathlib.Analysis.Calculus.Deriv.Mul
public import Mathlib.Analysis.Calculus.Deriv.Slope
public import Mathlib.Analysis.Convex.Deriv
public import Mathlib.Basic.Real.Basic
public import Mathlib.Data.Int.Interval
public import Mathlib.Data.Pi.Interval
public import Mathlib.Order.ConditionallyCompleteLattice.Basic
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring
public import Mathlib.Topology.Order.Compact

/-! A clipped sufficient scale for convex C² quadratic cuts. Global ambient convexity and C² regularity are required. The anchor need not lie in B. The scale is not claimed maximal, positive or computable. -/
@[expose] public section
noncomputable section
open scoped BigOperators
open Set

namespace Chapter02
abbrev RealVector (n : ℕ) := Fin n → ℝ
end Chapter02

namespace Chapter05.Quadratic
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

def tangent (f : E → ℝ) (a x : E) : ℝ := f a + fderiv ℝ f a (x-a)
def curvature (f : E → ℝ) (a x : E) : ℝ :=
  fderiv ℝ (fderiv ℝ f) a (x-a) (x-a)
def cut (f : E → ℝ) (a : E) (α : ℝ) (x : E) : ℝ :=
  tangent f a x + (α/2)*curvature f a x

def positiveCurvatureDomain (f : E → ℝ) (a : E) (B : Set E) : Set E :=
  {x ∈ B | 0 < curvature f a x}

def ratioSet (f : E → ℝ) (a : E) (B : Set E) : Set ℝ :=
  (fun x => (f x - tangent f a x) / curvature f a x) ''
    positiveCurvatureDomain f a B

/-- Preserve the numeral witness name used by the independently compiled source. -/
theorem safeScale._proof_1 : Nat.AtLeastTwo (1 + 1) :=
  @Nat.instAtLeastTwoHAddOfNat 1 (@Nat.instNeZeroSucc 0)

def safeScale (f : E → ℝ) (a : E) (B : Set E) : ℝ := by
  classical
  exact if (positiveCurvatureDomain f a B).Nonempty then
    min 1 ((@OfNat.ofNat ℝ (nat_lit 2) (@instOfNatAtLeastTwo ℝ (nat_lit 2) Real.instNatCast safeScale._proof_1)) * sInf (ratioSet f a B)) else 1

end Chapter05.Quadratic

namespace PalomarQuadratic
open Chapter05.Quadratic

/-- The scale is in [0,1]; each nonnegative coefficient below it supplies a cut
between the tangent and f on B, and below the unit second-order cut. -/
theorem solution {n p : ℕ}
    {f : Chapter02.RealVector (n+p) → ℝ} (hconv : ConvexOn ℝ univ f)
    (hC2 : ContDiff ℝ 2 f) (a : Chapter02.RealVector (n+p))
    (B : Set (Chapter02.RealVector (n+p))) :
    (0 ≤ safeScale f a B ∧ safeScale f a B ≤ 1) ∧
      ∀ α : ℝ, 0 ≤ α → α ≤ safeScale f a B →
        ∀ x ∈ B, tangent f a x ≤ cut f a α x ∧ cut f a α x ≤ f x ∧
          cut f a α x ≤ cut f a 1 x := by
  sorry

end PalomarQuadratic

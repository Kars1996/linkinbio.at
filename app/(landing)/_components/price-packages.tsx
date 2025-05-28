import { Container } from "../../../components/ui/container";
import { CardSpotlightEffect } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import { Check } from "lucide-react";
import Link from "next/link";

export const prices = [
  {
    title: "Basic",
    button: "Start for free",
    description: "Essential features to get you started",
    included: "What's included",
    features: [
      "All core features",
      "Up to 10 links",
      "Fully customizable buttons", 
      "Top icon styles",
      "SEO optimization",
    ],
  },
  {
    title: "Premium",
    button: "Get started with Premium",
    description: "Unlock advanced features for your biolink page",
    price: 14.99,
    included: "Everything from Free, plus",
    features: [
      "Unlimited links",
      "Analytics", 
      "Title Effects",
      "Layout customization",
      "Weather Effects",
      ".GIF and video support",
      "Spotify, SoundCloud, and YouTube content",
    ],
  },
];

export function PricePackages() {
  return (
    <Container>
      <div className="flex flex-col items-center justify-center gap-8 md:flex-row">
        {prices.map((item, index) => {
          const featured = index === 1;
          return (
            <div
              key={index}
              className={cn(
                "w-full max-w-sm rounded-xl bg-gradient-to-br from-[#0B363C]/10 to-[#0B363C]/50 p-px shadow-lg shadow-teal-950/5 md:self-end",
                featured && "from-[#39997c]/20 to-60%",
              )}
            >
              <CardSpotlightEffect
                className={cn(
                  "overflow-hidden bg-[#0B363C]/50 border border-teal-800 bg-gradient-to-b from-[#0B363C]/50 to-[#0B363C]/75 text-white backdrop-blur-sm",
                  featured && "from-[#39997c]/10",
                )}
              >
                {featured && (
                  <div className="absolute right-0 top-0 m-2 rounded-full border border-[#39997c] bg-gradient-to-r from-[#39997c]/5 to-[#39997c]/25 px-3 py-1.5 text-xs text-[#E3FFCC] shadow-2xl">
                    Recommended
                  </div>
                )}
                <div>
                  <div className="mb-2 text-xl font-medium text-[#E3FFCC]">
                    {item.title}
                  </div>
                  <p className="text-sm text-[#B8CEC1]">{item.description}</p>
                </div>
                <div className="my-4 h-1 border-t border-dashed border-[#39997c]/20"></div>
                <div>
                  <div className="space-y-1">
                    <div
                      style={{
                        filter: `drop-shadow(0 0 0.25rem rgba(227, 255, 204, 0.5))`,
                      }}
                      className="bg-gradient-to-b from-[#E3FFCC] to-[#39997c] bg-clip-text text-4xl font-bold text-transparent"
                    >
                      {item.price ? `€${item.price}` : "Free"}
                    </div>
                    <div className="text-xs text-[#B8CEC1]">
                      {item.price ? "Lifetime" : "Forever"}
                    </div>
                  </div>
                </div>
                <div className="mt-4 w-full">
                  <Link
                    href="/sign-in"
                    className={cn(
                      "block w-full rounded-lg border border-[#39997c]/20 bg-[#0B363C]/50 px-5 py-2.5 text-center text-sm shadow-lg transition-colors duration-200 hover:bg-[#39997c]/20",
                      featured &&
                        "border-[#39997c]/40 bg-[#39997c]/20 hover:bg-[#39997c]/30",
                    )}
                  >
                    <span
                      style={{
                        filter: `drop-shadow(0 0 1rem rgba(227, 255, 204, 0.3))`,
                      }}
                      className="text-[#E3FFCC]"
                    >
                      {item.button}
                    </span>
                  </Link>
                </div>
                <div className="mt-4">
                  <div className="mb-4 bg-gradient-to-b from-[#E3FFCC] to-[#39997c] bg-clip-text text-sm font-bold text-transparent">
                    {item.included}
                  </div>
                  <ul className="mb-4 space-y-2">
                    {item.features.map((item, index) => (
                      <li key={index} className="flex items-baseline gap-2">
                        <Check className="size-3 shrink-0 text-[#39997c]" />
                        <span className="text-sm text-[#B8CEC1]">{item}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </CardSpotlightEffect>
            </div>
          );
        })}
      </div>
    </Container>
  );
}